// import 'package:flutter/material.dart';
//
// class SearchAnchorWithTap extends StatefulWidget {
//   const SearchAnchorWithTap({super.key});
//
//   @override
//   State<SearchAnchorWithTap> createState() => _SearchAnchorWithTapState();
// }
//
// class _SearchAnchorWithTapState extends State<SearchAnchorWithTap> {
//   final List<Map<String, String>> allItems = [
//     {
//       'title': 'Apple',
//       'subtitle': 'Red and juicy',
//       'description': 'Contains fiber and vitamin C',
//     },
//     {
//       'title': 'Banana',
//       'subtitle': 'Yellow and long',
//       'description': 'Great source of potassium',
//     },
//     {
//       'title': 'Mango',
//       'subtitle': 'King of fruits',
//       'description': 'Tropical and sweet',
//     },
//   ];
//
//   String selectedItem = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Search with Tap on Container')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SearchAnchor.bar(
//           barHintText: 'Search fruits...',
//           suggestionsBuilder: (context, controller) {
//             final query = controller.text.toLowerCase();
//             final results =
//                 allItems.where((item) {
//                   return item['title']!.toLowerCase().contains(query);
//                 }).toList();
//
//             return results.map((item) {
//               return GestureDetector(
//                 onTap: () {
//                   controller.closeView(item['title']);
//                   setState(() {
//                     selectedItem = item['title']!;
//                   });
//                   // Add your custom logic here
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 6.0),
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade100,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.blueAccent),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           item['title']!,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blueAccent,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           item['subtitle']!,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontStyle: FontStyle.italic,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           item['description']!,
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }).toList();
//           },
//         ),
//       ),
//       bottomNavigationBar:
//           selectedItem.isNotEmpty
//               ? Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'You selected: $selectedItem',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               )
//               : null,
//     );
//   }
// }
