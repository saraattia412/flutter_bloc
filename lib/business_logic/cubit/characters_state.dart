part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
   final CharactersModel characters;

  CharactersLoaded(this.characters);
}

