// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/ui/widgets/cached_image.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/model/network_media_list_model.dart';
// import 'package:rent_chicken/features/chat/widgets/video_player.dart';

// import '../../../core/constant/text_styles/app_text_style.dart';
// import '../../../core/constant/text_styles/font_size.dart';
// import 'preview_photos_chat.dart';

// class NetworkPhotoChatWidget extends StatefulWidget {
//   final LastMessageModel messageModel;

//   final Function whenDone;
//   const NetworkPhotoChatWidget(
//       {super.key, required this.messageModel, required this.whenDone});

//   @override
//   State<NetworkPhotoChatWidget> createState() => _NetworkPhotoChatWidgetState();
// }

// class _NetworkPhotoChatWidgetState extends State<NetworkPhotoChatWidget> {
//   List<NetworkMediaListModel> mediaList = [];
//   @override
//   void initState() {
//     super.initState();
//     widget.messageModel.photos?.forEach((element) {
//       mediaList
//           .add(NetworkMediaListModel(isPhoto: true, url: element.url ?? ''));
//     });
//     widget.messageModel.videos?.forEach((element) {
//       mediaList
//           .add(NetworkMediaListModel(isPhoto: false, url: element.url ?? ''));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return (mediaList.length <= 4)
//         ? Wrap(
//             runSpacing: 8,
//             spacing: 9,
//             children: List.generate(
//               mediaList.length,
//               (index) => InkWell(
//                 onTap: () {
//                   context.read<ChatCubit>().networkPreviewMediaMessage =
//                       widget.messageModel;
//                   context.read<ChatCubit>().isShowPreview = true;
//                   widget.whenDone();
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PreviewPhotoChat(
//                           whenDone: () {},
//                           mediaList: mediaList,
//                         ),
//                       ));
//                 },
//                 child: Container(
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     height: 140.h,
//                     width: 0.26.sw,
//                     decoration: const BoxDecoration(
//                         color: Colors.transparent,
//                         borderRadius: BorderRadius.all(Radius.circular(8))),
//                     child: mediaList[index].isPhoto
//                         ? CachedImage(
//                             imageUrl: mediaList[index].url,
//                             fit: BoxFit.fill,
//                             // /  height: 135.h,
//                             //width: 210.w,
//                           )
//                         : VideoPlayerScreen(
//                             url: mediaList[index].url,
//                             fromChat: true,
//                           )),
//               ),
//             ),
//           )
//         : Wrap(
//             runSpacing: 8,
//             spacing: 9,
//             children: List.generate(
//               4,
//               (index) => InkWell(
//                 onTap: () {
//                   context.read<ChatCubit>().networkPreviewMediaMessage =
//                       widget.messageModel;
//                   context.read<ChatCubit>().isShowPreview = true;
//                   widget.whenDone();
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PreviewPhotoChat(
//                           mediaList: mediaList,
//                           whenDone: () {},
//                         ),
//                       ));
//                 },
//                 child: Stack(
//                   children: [
//                     Container(
//                         height: 135.h,
//                         width: 0.26.sw,
//                         decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         child: mediaList[index].isPhoto
//                             ? CachedImage(
//                                 imageUrl: mediaList[index].url,
//                                 fit: BoxFit.fill,
//                               )
//                             : VideoPlayerScreen(
//                                 url: mediaList[index].url,
//                                 fromChat: true,
//                               )),
//                     if (index == 3)
//                       Container(
//                         height: 135.h,
//                         width: 110.w,
//                         color: Colors.black.withOpacity(0.3),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(Icons.add, color: Colors.white),
//                             Text(
//                               (mediaList.length - 3).toString(),
//                               style: AppTextStyle.getRegularStyle(
//                                   color: Colors.white,
//                                   fontSize: AppFontSize.size_26),
//                             )
//                           ],
//                         ),
//                       )
//                   ],
//                 ),
//               ),
//             ));
//   }
// }
