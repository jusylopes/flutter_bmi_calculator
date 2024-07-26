import 'package:bmi_calculator/blocs/character/character_state.dart';
import 'package:bmi_calculator/models/character.dart';
import 'package:bmi_calculator/repositories/character_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository characterRepository;

  CharacterCubit(this.characterRepository) : super(CharacterInitialState());

  Future<void> loadCharacter() async {
    emit(CharacterLoadingState());
    final Character? character = await characterRepository.getCharacter();

    if (character != null) {
      emit(CharacterSelectedState(character));
    } else {
      emit(CharacterNotSelectedState());
    }
  }

  Future<void> saveCharacter(Character character) async {
    await characterRepository.saveCharacter(character);
    emit(CharacterSelectedState(character));
  }
}
