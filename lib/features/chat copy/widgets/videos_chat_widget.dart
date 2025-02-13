// import 'package:flutter/material.dart';
// import 'package:rent_chicken/core/constant/app_theme/app_styles.dart';
// import 'package:rent_chicken/features/chat/data/chat_controller/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/widget/video_player.dart';
// import 'package:rent_chicken/features/chat/widget/video_preview_flutter.dart';
// import '../../../core/ui/widget/cashed_image_net_work_widget/cashed_image_widget.dart';
//
//
// class VideosChatWidget extends StatelessWidget {
//   final LastMessageModel messageModel;
//
//   final Function whenDone;
//   const VideosChatWidget({Key? key, required this.messageModel,  required this.whenDone})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return (messageModel.videos!.length<=4 )
//         ? Wrap(
//       runSpacing: 8,
//       spacing: 9,
//       children: List.generate(
//         messageModel.videos!.length,
//             (index) => InkWell(
//           onTap: () {
//             chatController.previewMediaMessage=messageModel;
//             chatController.isShowPreview=true;
//             whenDone();
//             Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewVideoChat(
//               chatController: chatController,
//             ),));
//           } ,
//           child: Container(
//             height: 150,
//             width: 100,
//             child:  VideoPlayerScreen(
//               url: messageModel.videos![index].url??'',
//               fromChat: true,
//             )
//           ),
//         ),
//       ),
//     )
//         : Wrap(
//         runSpacing: 8,
//         spacing: 9,
//         children: List.generate(
//           4,
//               (index) => InkWell(
//             onTap: () {
//               chatController.previewMediaMessage=messageModel;
//               chatController.isShowPreview=true;
//               whenDone();
//               Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewVideoChat(
//                 chatController: chatController,
//               ),));
//             } ,
//             child: Stack(
//               children: [
//                 Container(
//                   height: 150,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(8))
//                   ),
//                   child: VideoPlayerScreen(
//                     url: messageModel.videos![index].url??'',
//                     fromChat: true,
//                   )),
//                 if(index==3)
//                   Container(
//                     height: 150,
//                     width: 100,
//                     color: Colors.black.withOpacity(0.3),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.add,color: Colors.white),
//                         Text( (messageModel.videos!.length-3).toString(),
//                           style: AppTheme.montserrat.copyWith(
//                               color:Colors.white,
//                               fontWeight: FontWeight.w400, fontSize: 26),
//                         )
//                       ],
//                     ),
//                   )
//               ],
//             ),
//           ),
//         ));
//   }
// }
