import 'package:bmi_calculator/controllers/favorite_controller.dart';
import 'package:bmi_calculator/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavoriteController>(context, listen: false).startDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            'Resultados Salvos',
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        leading: const Icon(Icons.arrow_forward_ios),
      ),
      body: Consumer<FavoriteController>(
        builder: (context, favorites, child) {
          return favorites.bmis.isEmpty
              ? const EmptyResultsMessage()
              : Column(
                  children: [
                    FavoriteBmiChart(favoriteList: favorites.bmis),
                    Expanded(
                      child: ListView.builder(
                        itemCount: favorites.bmis.length,
                        itemBuilder: (_, index) {
                          final favoriteItem = favorites.bmis[index];

                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              favorites.deleteBmi(id: favoriteItem.id);
                            },
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (_) async {
                              return await _confirmDismissDialog(context);
                            },
                            child: FavoriteCard(favoriteItem: favoriteItem),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Future<bool?> _confirmDismissDialog(BuildContext context) {
    ButtonStyle buttonStyle(Color color) {
      return ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      );
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: const Text('Tem certeza que deseja excluir este resultado?'),
          actions: <Widget>[
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: buttonStyle(Theme.of(context).primaryColor),
                    child: const Text(
                      'EXCLUIR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: buttonStyle(
                        Theme.of(context).primaryColor.withOpacity(0.7)),
                    child: const Text(
                      'CANCELAR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
