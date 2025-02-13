// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rent_chicken/core/constant/app_icons/app_icons.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
//
// class PopUpAttachment extends StatelessWidget {
//   final Function whenDone;
//   const PopUpAttachment({Key? key,  required this.whenDone}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       width: 22,
//       child: PopupMenuButton(
//         onOpened: () {
//           if (FocusScope.of(context).hasFocus) {
//             Future.delayed(const Duration(milliseconds: 50)).whenComplete(() => FocusScope.of(context).requestFocus());
//           }
//         },
//         onSelected:  (value) {
//           Navigator.pop(context);
//           },
//         padding: EdgeInsets.zero,
//         icon: SvgPicture.asset(mediaIcon),
//         elevation:0,
//         offset: const Offset(-10, -90),
//         itemBuilder: (context) => <PopupMenuItem<PopUpRowWidget>>[
//           PopupMenuItem<PopUpRowWidget>(
//             child:PopUpRowWidget(
//               title:'photos' ,
//               icon:Icons.photo ,
//               onTap: () {
//                 Navigator.pop(context);
//                 FocusScope.of(context).unfocus();
//                 context.read<ChatCubit>().selectImage(imageSource: ImageSource.gallery,
//                 whenDone: whenDone());}
//             ),),
//           PopupMenuItem<PopUpRowWidget>(
//             child:PopUpRowWidget(
//               title:'videos' ,
//               icon:Icons.video_call_rounded ,
//               onTap: (){
//                 Navigator.pop(context);
//                 FocusScope.of(context).unfocus();
//                 context.read<ChatCubit>().selectVideo(whenDone: whenDone());}
//             ),),
//         ],),
//     );
//   }
// }
//
//
// class PopUpRowWidget extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;
//   const PopUpRowWidget({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap:onTap ,
//       child: Row(
//         children: [
//           Icon(icon),
//           const SizedBox(width: 8,),
//           Text(title),
//         ],
//       ),
//     );
//   }
// }
