// import 'package:flutter/material.dart';
// import 'package:rent_chicken/core/constant/app_colors/app_colors.dart';
// import 'package:rent_chicken/core/constant/text_styles/font_size.dart';
// import 'package:rent_chicken/features/store/widgets/cover_photo_widget.dart';

// import '../../../core/constant/text_styles/app_text_style.dart';

// class ChatAppBar extends StatelessWidget {
//   final Widget? photoWidget;
//   final String photo;
//   final String name;
//   final int userId;
//   final bool isSupport;
//   const ChatAppBar({
//     super.key,
//     required this.photo,
//     required this.name,
//     required this.userId,
//     this.isSupport = false,
//     this.photoWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.white, boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.1),
//           spreadRadius: 0,
//           blurRadius: 4,
//           offset: const Offset(0, 2),
//         )
//       ]),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15),
//         child: InkWell(
//           // onTap: (isSupport)?(){}:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) =>
//           //     FarmDetails(
//           //       returnBack: true,
//           //       userId:userId,
//           //     ))),
//           child: Row(
//             children: [
//               InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Icon(Icons.arrow_back_ios_new_rounded,
//                         color: AppColors.greyDD),
//                   )),
//               const SizedBox(
//                 width: 5,
//               ),
//               (photoWidget != null)
//                   ? photoWidget!
//                   : SizedBox(
//                       height: 50,
//                       width: 50,
//                       child: CoverPhotoWidget(
//                         photoUrl: photo,
//                       ),
//                     ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 child: Text(
//                   name,
//                   style: AppTextStyle.getSemiBoldStyle(
//                       color: AppColors.black, fontSize: AppFontSize.size_14),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
