import 'package:rick_and_morty_app/data/datasources/character_api.dart';
import 'package:rick_and_morty_app/data/models/character_model.dart';

class CharacterRepository {
  final CharacterApi characterApi;

  CharacterRepository(this.characterApi);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterApi.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}

// void main() async {
//   final characterApi = CharacterApi();
//   final characterRepository = CharacterRepository(characterApi);

//   try {
//     final characters = await characterRepository.getAllCharacters();
//     print("Fetched Characters: ");
//     for (var character in characters) {
//       print("Name: ${character.name}, Status: ${character.status}");
//     }
//   } catch (e) {
//     print("Error fetching characters: $e");
//   }
// }
