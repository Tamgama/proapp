// import 'package:flutter/material.dart';
// import 'package:proapp/screens/feed_screen/widgets/posts.dart';

// const mobileWidth = 600;

// class MobileHome extends StatelessWidget {
//   final List<Widget> pages;
//   final int currentPage;

//   MobileHome({required this.pages, required this.currentPage, Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[200],
//       appBar: AppBar(
//         title: Text('M O B I L E'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // fotos
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Container(
//                   color: const Color.fromARGB(255, 192, 205, 117),
//                   height: 120,
//                 ),
//               ),
//             ),

//             //
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       color: Colors.deepPurple[300],
//                       height: 120,
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MobileVideo extends StatelessWidget {
//   final List<Widget> pages;
//   final int currentPage;

//   const MobileVideo({required this.pages, required this.currentPage, Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[200],
//       appBar: AppBar(
//         title: Text('M O B I L E'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // fotos
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: CardList(),
//               ),
//             ),

//             //
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       color: Colors.deepPurple[300],
//                       height: 120,
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MobileSearchs extends StatelessWidget {
//   final List<Widget> pages;
//   final int currentPage;

//   const MobileSearchs(
//       {required this.pages, required this.currentPage, Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[200],
//       appBar: AppBar(
//         title: Text('M O B I L E'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // fotos
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: CardList(),
//               ),
//             ),
//             //
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       color: Colors.deepPurple[300],
//                       height: 120,
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MobileProfile extends StatelessWidget {
//   final List<Widget> pages;
//   final int currentPage;

//   const MobileProfile(
//       {required this.pages, required this.currentPage, Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[200],
//       appBar: AppBar(
//         title: Text('M O B I L E'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // fotos
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: CardList(),
//               ),
//             ),

//             //
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       color: Colors.deepPurple[300],
//                       height: 120,
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
