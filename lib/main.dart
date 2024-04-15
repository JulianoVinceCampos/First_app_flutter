// Importa os pacotes e arquivos necessários
import 'package:first_app_flutter/pages/character_page.dart'; // Importa a página de personagens
import 'package:flutter/material.dart'; // Importa o pacote Flutter de Material Design

// Função principal, ponto de entrada da aplicação
void main() {
  // Executa a aplicação
  runApp(MyApp());
}

// Define o widget principal da aplicação
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna o widget MaterialApp, que fornece funcionalidades principais para aplicativos Flutter
    return MaterialApp(
      // Define o título da aplicação
      title: 'Aplicativo do Rick and Morty',
      // Define o tema da aplicação
      theme: ThemeData(
        // Define a cor primária como azul
        primarySwatch: Colors.blue,
        // Define a densidade visual para a plataforma adaptativa
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define a rota inicial como o widget CharacterPage
      home: CharacterPage(),
    );
  }
}
