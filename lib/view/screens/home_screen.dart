import 'package:bmi_calculator/blocs/character/character_cubit.dart';
import 'package:bmi_calculator/blocs/character/character_state.dart';
import 'package:bmi_calculator/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  final int initialTabIndex;
  const HomeScreen({super.key, this.initialTabIndex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;
  final List<Widget> _pages = [
    const BmiCalculatorScreen(),
    const FavoriteScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex;
    context.read<CharacterCubit>().loadCharacter();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterNotSelectedState) {
            return const CharacterScreen();
          }
          return _pages.elementAt(_selectedIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.archive_1),
            label: 'Resultados',
          )
        ],
      ),
    );
  }
}
