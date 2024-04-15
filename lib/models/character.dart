// Classe que representa um personagem
class Character {
  // Atributos de um personagem
  final int id; // ID do personagem
  final String name; // Nome do personagem
  final String status; // Status do personagem (vivo, morto, etc.)
  final String species; // Espécie do personagem
  final String image; // URL da imagem do personagem
  final String locationName; // Nome do local onde o personagem está

  // Construtor da classe Character
  Character({
    required this.id, // O ID é obrigatório
    required this.name, // O nome é obrigatório
    required this.status, // O status é obrigatório
    required this.species, // A espécie é obrigatória
    required this.image, // A URL da imagem é obrigatória
    required this.locationName, // O nome do local é obrigatório
  });
}
