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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: favoriteItem.colorClassification,
          child: ListTile(
            leading: Text(
              favoriteItem.bmi.toStringAsFixed(1),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            title: Text(
              favoriteItem.classification,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              formatDate(favoriteItem.date.toString()),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
    );
  }
}

String formatDate(String inputString) {
  DateTime dateTime = DateTime.parse(inputString);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}
