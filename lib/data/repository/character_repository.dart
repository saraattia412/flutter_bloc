// ignore_for_file: avoid_print

import 'package:flutter_bloc_app/data/models/characters.dart';

import '../web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<dynamic> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    print('data now in repository');
    return CharactersModel.fromJson(characters);
  }
}
