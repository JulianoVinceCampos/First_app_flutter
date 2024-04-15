// Importa os pacotes e arquivos necessários
import 'package:first_app_flutter/blocs/character_bloc.dart'; // Importa o bloco de personagens
import 'package:first_app_flutter/models/character.dart'; // Importa o modelo de personagem
import 'package:first_app_flutter/widgets/character_list.dart'; // Importa o widget de lista de personagens
import 'package:flutter/material.dart'; // Importa o pacote Flutter de Material Design

// Classe para a página de personagens, que é um StatefulWidget
class CharacterPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

// Estado da página de personagens
class _CharacterPageState extends State<CharacterPage> {
  // Controlador de rolagem da lista de personagens
  final _scrollController = ScrollController();
  // Limiar de rolagem para carregar mais personagens
  final _scrollThreshold = 200.0;
  // Página atual de personagens
  int _page = 1;

  // Método chamado quando o estado é inicializado
  @override
  void initState() {
    super.initState();
    // Adiciona um ouvinte para detectar a rolagem da lista
    _scrollController.addListener(_onScroll);
    // Busca os personagens da primeira página ao inicializar
    characterBloc.fetchCharacters(_page);
  }

  // Método chamado quando o estado é descartado
  @override
  void dispose() {
    // Descarta o controlador de rolagem
    _scrollController.dispose();
    // Descarta o bloco de personagens
    characterBloc.dispose();
    super.dispose();
  }

  // Método chamado quando a lista é rolada
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // Verifica se a lista está próxima do final e carrega mais personagens se necessário
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _page++;
      characterBloc.fetchCharacters(_page);
    }
  }

  // Método responsável por construir a interface da página de personagens
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personagens de Rick and Morty'), // Título da barra de navegação
      ),
      body: StreamBuilder<List<Character>>(
        // Constrói um widget com base no stream de personagens do bloco
        stream: characterBloc.characters,
        builder: (context, snapshot) {
          // Verifica se há um erro no snapshot
          if (snapshot.hasError) {
            // Retorna um widget de texto exibindo o erro
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          }
          // Verifica se ainda não há dados no snapshot
          if (!snapshot.hasData) {
            // Retorna um indicador de progresso enquanto os dados estão sendo carregados
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // Retorna o widget de lista de personagens com os dados do snapshot
          return CharacterList(characters: snapshot.data!);
        },
      ),
    );
  }
}
