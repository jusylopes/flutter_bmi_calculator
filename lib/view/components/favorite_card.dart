import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.favoriteItem,
  });

  final BmiFavoriteModel favoriteItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        favoriteItem.bmi.toStringAsFixed(1),
        style: Theme.of(context).textTheme.titleLarge,
      ),
      title: Text(
        favoriteItem.classification,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        formatDate(favoriteItem.data.toString()),
        style: Theme.of(context).textTheme.titleSmall,
      ),
      tileColor: favoriteItem.color,
      trailing: const Icon(Icons.arrow_back_ios),
    );
  }
}

String formatDate(String inputString) {
  DateTime dateTime = DateTime.parse(inputString);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}
