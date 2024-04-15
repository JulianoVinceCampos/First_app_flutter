// Importa os pacotes e arquivos necessários
import 'package:first_app_flutter/models/character.dart'; // Importa o modelo de personagem
import 'package:http/http.dart' as http; // Importa o pacote HTTP para fazer requisições HTTP
import 'dart:convert'; // Importa o pacote para codificar e decodificar JSON

// Classe responsável por lidar com a obtenção de personagens da API
class CharacterRepository {
  // Método para buscar personagens com base no número da página
  Future<List<Character>> fetchCharacters(int page) async {
    // Faz uma requisição GET para a API dos personagens de Rick and Morty
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));
    // Verifica se a resposta da requisição foi bem-sucedida (código 200)
    if (response.statusCode == 200) {
      // Decodifica o JSON da resposta da requisição
      final jsonData = json.decode(response.body);
      // Mapeia os dados dos personagens e cria objetos Character correspondentes
      return (jsonData['results'] as List)
          .map((character) => Character(
        id: character['id'],
        name: character['name'],
        status: character['status'],
        species: character['species'],
        image: character['image'],
        locationName: character['location']['name'],
      ))
          .toList(); // Converte o resultado para uma lista de personagens
    } else {
      // Lança uma exceção caso a requisição falhe
      throw Exception('Falha ao carregar os personagens');
    }
  }
}
