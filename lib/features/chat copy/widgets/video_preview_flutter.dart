// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/ui/widget/cashed_image_net_work_widget/cashed_image_widget.dart';
// import 'package:rent_chicken/features/chat/data/chat_controller/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/widget/video_player.dart';
//
// class PreviewVideoChat extends StatelessWidget {
//
//   const PreviewVideoChat({Key? key, required this.chatController}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     PageController? controller=PageController();
//     return Card(
//       child: Container(
//         height:1.sh,
//         decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.6),
//             borderRadius: BorderRadius.all(Radius.circular(8))
//         ),
//         child: PageView(
//           controller:controller ,
//           children: List.generate(chatController.previewMediaMessage!.videos!.length, (pageIndex) =>
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     SizedBox(height: 0.03.sh,),
//                     InkWell(
//                         onTap: () => Navigator.pop(context),
//                         child: Icon(Icons.close,color: Colors.white)),
//                     Expanded(
//                       child: Padding(
//                         padding:  EdgeInsets.only(top: 0.05.sh),
//                         child: Center(
//                           child: VideoPlayerScreen(url: chatController.previewMediaMessage!.videos![pageIndex].url??''),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: SizedBox(
//                         height: 70,
//                         child: Row(
//                           children: [
//                             InkWell(
//                                 onTap: () => controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear),
//                                 child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white)),
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 10),
//                                 child: ListView.separated(
//                                     shrinkWrap: true,
//                                     scrollDirection: Axis.horizontal,
//                                     itemBuilder: (context, index) => InkWell(
//                                       onTap: () => controller.animateToPage(index,duration: Duration(milliseconds: 500), curve: Curves.linear) ,
//                                       child:  Stack(
//                                         children: [
//                                           CachedImage(
//                                               height: 50,
//                                               width: 50,
//                                               imageUrl: chatController.previewMediaMessage!.videos![index].url??'', fit: BoxFit.fill),
//                                           if((index!=pageIndex))
//                                             Container(
//                                                 height: 50,
//                                                 width: 50,
//                                                 decoration:BoxDecoration(
//                                                   color:   Colors.black.withOpacity(0.6),
//                                                 )
//
//                                             )
//
//                                         ],
//                                       ),
//                                     ),
//                                     separatorBuilder: (context, index) =>SizedBox(width: 12,) ,
//                                     itemCount: chatController.previewMediaMessage!.videos!.length),
//                               ),
//                             ),
//                             InkWell(
//                                 onTap: () => controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.bounceInOut),
//                                 child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white)),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//           ),
//         ),
//       ),
//     );
//   }
// }
