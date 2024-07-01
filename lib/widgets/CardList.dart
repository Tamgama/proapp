import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(98, 255, 0, 140),
        // borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          pair.asPascalCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var isFav = appState.favorites.contains(pair);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 242, 215), //color marco
        // borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(41, 0, 0, 0),
              blurRadius: 6,
              offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigCard(pair: pair),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month),
                  label: Text("Cita"),
                ),
                SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite(pair);
                  },
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                  label: Text("Like"),
                ),
              ],
            ),
          ),
          Text(
            """Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            Donec molestie non nisl accumsan feugiat. Ut vulputate elementum nibh,
            at scelerisque lectus luctus sit amet. Suspendisse potenti.""",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPairs = generateWordPairs().take(10).toList();

    return ListView.builder(
      itemCount: wordPairs.length,
      itemBuilder: (context, index) {
        return CardItem(pair: wordPairs[index]);
      },
    );
  }
}
