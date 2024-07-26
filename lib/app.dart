import 'package:bmi_calculator/blocs/character/character_cubit.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/controllers/favorite_controller.dart';
import 'package:bmi_calculator/repositories/bmi_favorite_repository.dart';
import 'package:bmi_calculator/repositories/character_repository.dart';
import 'package:bmi_calculator/view/home_screen.dart';
import 'package:bmi_calculator/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BmiController>(
          create: (_) => BmiController(),
        ),
        ChangeNotifierProvider<FavoriteController>(
          create: (_) => FavoriteController(BmiFavoriteRepository()),
        ),
        BlocProvider<CharacterCubit>(
          create: (_) => CharacterCubit(CharacterRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: AppTheme.light,
      ),
    );
  }
}
