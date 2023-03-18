// import 'package:flutter/material.dart';

// class UserData extends StatelessWidget {
//   final String username;
//   String? image;
//   UserData({super.key, required this.username, this.image});

//   final style = const TextStyle(fontSize: 18, color: Colors.white);

//   bool isNull = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(22.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 52.0,
//             child: isNull
//                 ? Image.network(
//                     image!,
//                     height: 85,
//                     fit: BoxFit.cover,
//                   )
//                 : const Placeholder(
//                     strokeWidth: 4.0,
//                     color: Colors.black26,
//                   ),
//           ),
//           Text(
//             username,
//             style: style,
//           ),
//         ],
//       ),
//     );
//   }
// }
