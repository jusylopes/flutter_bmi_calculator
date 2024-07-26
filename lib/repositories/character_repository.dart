import 'package:bmi_calculator/models/character.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterRepository {
  static const String _characterKey = 'character';

  Future<void> saveCharacter(Character character) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_characterKey, character.toString().split('.').last);
  }

  Future<Character?> getCharacter() async {
    final prefs = await SharedPreferences.getInstance();
    final String? characterString = prefs.getString(_characterKey);

    if (characterString == null) return null;

    return Character.values
        .firstWhere((e) => e.toString().split('.').last == characterString);
  }
}
