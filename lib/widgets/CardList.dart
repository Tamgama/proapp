import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final imageUrls = appState.images.take(10).toList();

    return ListView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return CardItem(imageUrl: imageUrls[index]);
      },
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(98, 255, 0, 140),
      ),
      child: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var isFav = appState.favorites.contains(imageUrl);

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
              offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigCard(imageUrl: imageUrl),
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
                    appState.toggleFavorite(imageUrl);
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
