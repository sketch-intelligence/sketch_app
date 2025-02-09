// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sketch/features/Profile/Presentation/user%20profile/views/profile_views.dart';
// import 'package:sketch/features/my%20profile/presentation/views/my_profile_view.dart';

// // Update with your actual path

// class UserImageContainer extends StatelessWidget {
//   final String imagePath;

//   const UserImageContainer({super.key, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     bool isSvg = imagePath.toLowerCase().endsWith('.svg');

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => MyProfilePage()), // Navigate to ProfileView
//         );
//       },
//       child: Container(
//         height: 50,
//         width: 50,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//         ),
//         child: ClipOval(
//           child: isSvg
//               ? SvgPicture.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                 )
//               : Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                 ),
//         ),
//       ),
//     );
//   }
// }
