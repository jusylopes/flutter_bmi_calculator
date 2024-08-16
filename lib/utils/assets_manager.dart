import 'package:bmi_calculator/models/character.dart';

class AssetsManager {
  static String fontFamilyPixel = 'Pixels';

  static String imagePath = 'assets/images';
  static String background = '$imagePath/background.png';
  static String characterBoy = '$imagePath/boy.png';
  static String characterGirl = '$imagePath/girl.png';
  static String characterMonster = '$imagePath/monster.png';
  static String characterOgre = '$imagePath/ogre.png';
  static String imageEmpty = '$imagePath/box_empty.png';
  static String scale = '$imagePath/scale.png';

  static String animationPath = 'assets/animations';
  static String animationCharacterBoy = '$animationPath/character_boy.riv';
  static String animationCharacterGirl = '$animationPath/character_girl.riv';
  static String animationCharacterMonster =
      '$animationPath/character_monster.riv';
  static String animationCharacterOgre = '$animationPath/character_ogre.riv';

  static String animationCharacterBoySad =
      '$animationPath/character_boy_sad.riv';
  static String animationCharacterGirlSad =
      '$animationPath/character_girl_sad.riv';
  static String animationCharacterMonsterSad =
      '$animationPath/character_monster_sad.riv';
  static String animationCharacterOgreSad =
      '$animationPath/character_ogre_sad.riv';

  static String getCharacterAsset(Character character, {bool isSad = false}) {
    switch (character) {
      case Character.boy:
        return isSad
            ? AssetsManager.animationCharacterBoySad
            : AssetsManager.animationCharacterBoy;
      case Character.girl:
        return isSad
            ? AssetsManager.animationCharacterGirlSad
            : AssetsManager.animationCharacterGirl;
      case Character.monster:
        return isSad
            ? AssetsManager.animationCharacterMonsterSad
            : AssetsManager.animationCharacterMonster;
      case Character.ogre:
        return isSad
            ? AssetsManager.animationCharacterOgreSad
            : AssetsManager.animationCharacterOgre;
      default:
        return isSad
            ? AssetsManager.animationCharacterMonsterSad
            : AssetsManager.animationCharacterMonster;
    }
  }
}
