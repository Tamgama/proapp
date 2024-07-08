import 'package:flutter/material.dart';
import 'package:proapp/screens/feed_screen/widgets/posts.dart';
import 'package:proapp/widgets/bottom_navbar.dart';

class DesktopHome extends StatelessWidget {
  final List<Widget> pages;
  final int currentPage;

  const DesktopHome({required this.pages, required this.currentPage, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 219, 204),
      appBar: AppBar(
        title: Text('D E S K T O P'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  // youtube video
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(aspectRatio: 16 / 9, child: CardList()),
                  ),

                  // comment section & recommended videos
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Color.fromARGB(255, 117, 173, 205),
                            height: 120,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // second column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: const Color.fromARGB(255, 117, 170, 205),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavbar(),
    );
  }
}

class DesktopVideo extends StatelessWidget {
  final List<Widget> pages;
  final int currentPage;

  const DesktopVideo(
      {required this.pages, required this.currentPage, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 219, 204),
      appBar: AppBar(
        title: Text('D E S K T O P'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  // youtube video
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(aspectRatio: 16 / 9, child: CardList()),
                  ),

                  // comment section & recommended videos
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Color.fromARGB(255, 117, 173, 205),
                            height: 120,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // second column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: const Color.fromARGB(255, 117, 170, 205),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DesktopSearchs extends StatelessWidget {
  final List<Widget> pages;
  final int currentPage;

  const DesktopSearchs(
      {required this.pages, required this.currentPage, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 219, 204),
      appBar: AppBar(
        title: Text('D E S K T O P'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  // youtube video
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(aspectRatio: 16 / 9, child: CardList()),
                  ),

                  // comment section & recommended videos
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Color.fromARGB(255, 117, 173, 205),
                            height: 120,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // second column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: const Color.fromARGB(255, 117, 170, 205),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DesktopSaved extends StatelessWidget {
  final List<Widget> pages;
  final int currentPage;

  const DesktopSaved(
      {required this.pages, required this.currentPage, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 219, 204),
      appBar: AppBar(
        title: Text('D E S K T O P'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  // youtube video
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(aspectRatio: 16 / 9, child: CardList()),
                  ),

                  // comment section & recommended videos
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Color.fromARGB(255, 117, 173, 205),
                            height: 120,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // second column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: const Color.fromARGB(255, 117, 170, 205),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DesktopProfile extends StatelessWidget {
  final List<Widget> pages;
  final int currentPage;

  const DesktopProfile(
      {required this.pages, required this.currentPage, Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 219, 204),
      appBar: AppBar(
        title: Text('D E S K T O P'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  // youtube video
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(aspectRatio: 16 / 9, child: CardList()),
                  ),

                  // comment section & recommended videos
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Color.fromARGB(255, 117, 173, 205),
                            height: 120,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // second column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: const Color.fromARGB(255, 117, 170, 205),
              ),
            )
          ],
        ),
      ),
    );
  }
}
