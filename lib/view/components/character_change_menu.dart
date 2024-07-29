import 'package:bmi_calculator/view/screens/character_screen.dart';
import 'package:flutter/material.dart';

class CharacterChangeMenu extends StatelessWidget {
  const CharacterChangeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          value: 'trocar_personagem',
          child: Center(
            child: Text(
              'Trocar Personagem',
            ),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'trocar_personagem') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CharacterScreen(),
            ),
          );
        }
      },
    );
  }
}
