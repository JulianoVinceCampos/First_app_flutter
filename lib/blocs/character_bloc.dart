// Importa os pacotes necessários
import 'dart:async'; // Importa o pacote para lidar com programação assíncrona

import 'package:first_app_flutter/models/character.dart'; // Importa o modelo de personagem
import 'package:first_app_flutter/repositories/character_repository.dart'; // Importa o repositório de personagens

// Classe responsável por gerenciar o fluxo de personagens
class CharacterBloc {
  // Instância do repositório de personagens
  final _repository = CharacterRepository();
  // Controlador de stream para emitir uma lista de personagens
  final _characterController = StreamController<List<Character>>();

  // Stream pública para obter a lista de personagens
  Stream<List<Character>> get characters => _characterController.stream;

  // Método para buscar personagens a partir de uma página
  void fetchCharacters(int page) async {
    try {
      // Obtém os personagens do repositório
      final characters = await _repository.fetchCharacters(page);
      // Adiciona os personagens à stream
      _characterController.sink.add(characters);
    } catch (e) {
      // Emite um erro na stream caso ocorra uma exceção
      _characterController.addError(e);
    }
  }

  // Método para liberar recursos quando o bloco não é mais necessário
  void dispose() {
    _characterController.close(); // Fecha o controlador de stream
  }
}

// Instância global do CharacterBloc, que pode ser acessada de qualquer lugar do aplicativo
final characterBloc = CharacterBloc();
