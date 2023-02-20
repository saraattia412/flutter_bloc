// ignore_for_file: public_member_api_docs, sort_constructors_first, no_duplicate_case_values
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_app/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_bloc_app/data/models/characters.dart';
import 'package:flutter_bloc_app/data/repository/character_repository.dart';
import 'package:flutter_bloc_app/presentation/screens/characters_details_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/characters_screen.dart';

import 'constants/strings.dart';
import 'data/web_services/characters_web_services.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) =>
                    CharactersCubit(charactersRepository),
                child: const CharactersScreen()));
      case AppStrings.charactersDetailsScreen:
        final data = settings.arguments as Data;
        return MaterialPageRoute(
            builder: (_) => CharactersDetailsScreen(
                  index: data.index,
                  charactersModel: data.charactersModel,
                ));

      default:
        return null;
    }
  }
}

class Data {
  final int index;
  final CharactersModel charactersModel;

  Data({required this.index, required this.charactersModel});
}
