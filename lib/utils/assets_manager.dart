import 'package:bmi_calculator/models/bmi_model.dart';

class AssetsManager {
  static String fontFamily = 'assets/fonts/Roboto-Regular.ttf';

  static String imagePath = 'assets/images';
  static String characterBoy = '$imagePath/character_boy.png';
  static String characterGirl = '$imagePath/character_girl.png';
  static String imageEmpty = '$imagePath/box_empty.png';

  static String animationPath = 'assets/animations';
  static String animationCharacterBoy = '$animationPath/character_boy.riv';
  static String animationCharacterGirl = '$animationPath/character_girl.riv';

  static String getCharacterAsset(Character character, bool isAnimation) {
    switch (character) {
      case Character.boy:
        return isAnimation
            ? AssetsManager.animationCharacterBoy
            : AssetsManager.characterBoy;
      case Character.girl:
        return isAnimation
            ? AssetsManager.animationCharacterGirl
            : AssetsManager.characterGirl;
      default:
        return AssetsManager.animationCharacterBoy;
    }
  }
}
