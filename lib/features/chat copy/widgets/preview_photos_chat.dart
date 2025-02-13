// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/ui/widgets/cached_image.dart';
// import 'package:rent_chicken/features/chat/data/model/network_media_list_model.dart';
// import 'package:rent_chicken/features/chat/widgets/video_player.dart';
// import '../cubit/chat_cubit.dart';
//
//
// class PreviewPhotoChat extends StatelessWidget {
//
//   final Function whenDone;
//   final List<NetworkMediaListModel> mediaList;
//   const PreviewPhotoChat({Key? key, required  this.mediaList, required this.whenDone}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     PageController? controller=PageController();
//     return Card(
//       child: Container(
//         height:1.sh,
//         decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.6),
//             borderRadius: const BorderRadius.all(Radius.circular(8))
//         ),
//         child: PageView(
//           controller:controller ,
//           children: List.generate(mediaList.length, (pageIndex) =>
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     SizedBox(height: 0.03.sh),
//                     InkWell(
//                         onTap: () {
//                           context.read<ChatCubit>().networkPreviewMediaMessage=null;
//                           context.read<ChatCubit>().isShowPreview=false;
//                           whenDone();
//                           Navigator.pop(context);
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Icon(Icons.close,color: Colors.white,size: 30,),
//                         )),
//                     (mediaList[pageIndex].isPhoto)
//                     ? Expanded(
//                       child: Padding(
//                         padding:  EdgeInsets.only(top: 0.05.sh),
//                         child: Center(
//                           child: AspectRatio(
//                             aspectRatio: 0.5,
//                             child: CachedImage(
//                               // width: 0.6.sw,
//                               // height:0.7.sh,
//                               imageUrl: mediaList[pageIndex].url ,
//                               fit:  BoxFit.fill
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                     : Expanded(
//                       child: Padding(
//                         padding:  EdgeInsets.only(top: 0.05.sh),
//                         child: Center(
//                           child: VideoPlayerScreen(url: mediaList[pageIndex].url),
//                         ),
//                       ),
//                     ),
//                      Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: SizedBox(
//                         height: 70,
//                         child: Row(
//                           children: [
//                             InkWell(
//                                 onTap: () => controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear),
//                                 child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white)),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                                 child: ListView.separated(
//                                     shrinkWrap: true,
//                                     scrollDirection: Axis.horizontal,
//                                     itemBuilder: (context, index) => InkWell(
//                                       onTap: () => controller.animateToPage(index,duration: const Duration(milliseconds: 500), curve: Curves.linear) ,
//                                       child:  Stack(
//                                         alignment: Alignment.center,
//                                         children: [
//                                           mediaList[index].isPhoto
//                                               ? CachedImage(
//                                                   height: 70,
//                                                   width: 50,
//                                                   imageUrl: mediaList[index].url, fit: BoxFit.fill)
//                                               : Container(
//                                                clipBehavior: Clip.antiAlias,
//                                                 decoration:const BoxDecoration(
//                                                 borderRadius:  BorderRadius.all(Radius.circular(8))
//                                                 ),
//                                                 child: VideoPlayerScreen(
//                                                     url: mediaList[index].url,
//                                                       fromChat: true,
//                                                     ),
//                                               ),
//                                           if((index!=pageIndex))
//                                             Container(
//                                                 clipBehavior: Clip.antiAlias,
//                                                 height: 70,
//                                                 width: 50,
//                                                 decoration:BoxDecoration(
//                                                   color:   Colors.black.withOpacity(0.6),
//                                                 )
//                                             )
//                                         ],
//                                       ),
//                                     ),
//                                     separatorBuilder: (context, index) =>const SizedBox(width: 12,) ,
//                                     itemCount: mediaList.length),
//                               ),
//                             ),
//                             InkWell(
//                                 onTap: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.bounceInOut),
//                                 child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white)),
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
