import 'package:bmi_calculator/models/character.dart';
import 'package:equatable/equatable.dart';

abstract class CharacterState extends Equatable {}

class CharacterInitialState extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterLoadingState extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterSelectedState extends CharacterState {
  final Character character;

  CharacterSelectedState(this.character);

  @override
  List<Object> get props => [character];
}

class CharacterNotSelectedState extends CharacterState {
  @override
  List<Object> get props => [];
}
