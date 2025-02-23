part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;
  
  CharacterLoaded(this.characters);
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);
}


class EposideLoaded extends CharacterState{
  final List<Episode> episodes;

  EposideLoaded(this.episodes);
}

class EposideError extends CharacterState{
  final String message;

  EposideError(this.message);
}