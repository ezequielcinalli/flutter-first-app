import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favoritesCount = appState.favorites.length;
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.displayMedium!;

    var titleText = "You have $favoritesCount favorites:";
    if (favoritesCount == 0) {
      titleText = "No favorites yet";
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(titleText, style: titleStyle),
        ),
        for (var favorite in appState.favorites)
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.delete_outline),
              color: theme.colorScheme.primary,
              onPressed: () => appState.deleteFavorite(favorite),
            ),
            title: Text(favorite.asLowerCase),
          )
      ],
    );
  }
}
