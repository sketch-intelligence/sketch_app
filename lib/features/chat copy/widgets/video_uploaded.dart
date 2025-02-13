// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/widgets/video_player.dart';
//
// class VideoUploaded extends StatelessWidget {
//   final File videoFile;
//   final int index;
//   final Function whenDone;
//   const VideoUploaded({required this.videoFile,Key? key,  required this.index, required this.whenDone}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topStart,
//       children: [
//         VideoPlayerScreen(
//           url: '',
//           videoFile: videoFile,
//           fromChat: true,
//           fromAssets: true,
//         ),
//         InkWell(
//             child: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: SvgPicture.asset('assets/icons/deleteIcon.svg',),
//             ),
//             onTap: (){
//               context.read<ChatCubit>().mediaList.removeAt(index);
//               whenDone();
//             })
//       ],
//     );
//   }
// }
