import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/constants/strings.dart';
import 'package:learn_bloc/data/datasources/character_api.dart';
import 'package:learn_bloc/data/models/character_model.dart';
import 'package:learn_bloc/data/repositories/character_repository.dart';
import 'package:learn_bloc/domain/cubit/character_cubit.dart';
import 'package:learn_bloc/presentation/pages/character_details_screen.dart';
import 'package:learn_bloc/presentation/pages/characters_screen.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterApi());
    charactersCubit = CharacterCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(
            character: character,
          ),
        );
    }
    return null;
  }
}
