// Importa os pacotes e arquivos necessários
import 'package:first_app_flutter/models/character.dart'; // Importa o modelo de personagem
import 'package:flutter/material.dart'; // Importa o pacote Flutter de Material Design

// Widget para exibir uma lista de personagens
class CharacterList extends StatelessWidget {
  // Lista de personagens a ser exibida
  final List<Character> characters;

  // Construtor da classe CharacterList
  CharacterList({required this.characters});

  // Método responsável por construir a interface da lista de personagens
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Define o número de itens na lista com base no tamanho da lista de personagens
      itemCount: characters.length,
      // Constrói cada item da lista
      itemBuilder: (context, index) {
        // Obtém o personagem na posição atual
        final character = characters[index];
        // Retorna um ListTile para exibir as informações do personagem
        return ListTile(
          // Ícone do personagem
          leading: CircleAvatar(
            // Imagem do personagem
            backgroundImage: NetworkImage(character.image),
          ),
          // Nome do personagem
          title: Text(character.name),
          // Subtítulo com mais detalhes sobre o personagem
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Espécie do personagem
              Text('Espécie: ${character.species}'),
              // Status do personagem
              Text('Status: ${character.status}'),
              // Nome do local onde o personagem está
              Text('Localização: ${character.locationName}'),
              // Adicione mais detalhes conforme necessário
            ],
          ),
        );
      },
    );
  }
}
