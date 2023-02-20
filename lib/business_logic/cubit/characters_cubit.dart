// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc_app/data/models/characters.dart';
import 'package:flutter_bloc_app/data/repository/character_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersCubit(
    this.charactersRepository,
  ) : super(CharactersInitial());

  static CharactersCubit git(context) => BlocProvider.of(context);

  CharactersModel? charactersModel;

  void getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      print('data now in bloc');
      charactersModel = characters;
      emit(CharactersLoaded(characters));
    }).catchError((erroe) {
      print(erroe.toString());
    });
  }
}
