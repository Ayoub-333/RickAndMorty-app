import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/models/character_model.dart';
import 'package:learn_bloc/data/models/episode_model.dart';
import 'package:learn_bloc/data/repositories/character_repository.dart';
import 'package:meta/meta.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];

  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then(
      (characters) {
        emit(CharacterLoaded(characters));
        this.characters = characters;
      },
    );

    return characters;
  }
}
