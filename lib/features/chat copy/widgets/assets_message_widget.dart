// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/constant/app_colors/app_colors.dart';
// import 'package:rent_chicken/features/chat/data/model/assets_media_list_model.dart';
// import '../../../core/constant/text_styles/app_text_style.dart';
// import '../../../core/constant/text_styles/font_size.dart';
// import 'video_player.dart';
//
// class AssetsPhotoChatWidget extends StatefulWidget {
//   final List<AssetsMediaListModel> mediaList;
//   const AssetsPhotoChatWidget({Key? key, required this.mediaList,})
//       : super(key: key);
//
//   @override
//   State<AssetsPhotoChatWidget> createState() => _AssetsPhotoChatWidget();
// }
//
// class _AssetsPhotoChatWidget extends State<AssetsPhotoChatWidget> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return (widget.mediaList.length<=4 )
//         ? Wrap(
//       runSpacing: 8,
//       spacing: 9,
//       children: List.generate(
//         widget.mediaList.length,
//             (index) => InkWell(
//           onTap: () {} ,
//           child: Container(
//               clipBehavior: Clip.antiAlias,
//               height: 135.h,
//               width: 110.w,
//               decoration: const BoxDecoration(
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.all(Radius.circular(8))
//               ),
//               child:widget.mediaList[index].isPhoto
//                   ?  Image.file(widget.mediaList[index].file)
//                   :  VideoPlayerScreen(
//                       url: '',
//                       videoFile: widget.mediaList[index].file,
//                       fromChat: true,
//                       fromAssets: true,
//               )
//           ),
//         ),
//       ),
//     )
//         : Wrap(
//         runSpacing: 8,
//         spacing: 9,
//         children: List.generate(4,
//               (index) => InkWell(
//             onTap: () {
//             } ,
//             child: Stack(
//               children: [
//                 Container(
//                     height: 135.h,
//                     width: 110.w,
//                     decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(8))
//                     ),
//                     child: widget.mediaList[index].isPhoto
//                         ?  Image.asset(
//                           widget.mediaList[index].file.path,
//                           fit: BoxFit.cover,
//                           )
//                         : VideoPlayerScreen(
//                           url: widget.mediaList[index].file.path,
//                           fromChat: true,
//                           fromAssets: true,
//                     )),
//                 if(index==3)
//                   Container(
//                     height: 135.h,
//                     width: 110.w,
//                     color: Colors.black.withOpacity(0.3),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(Icons.add,color: Colors.white),
//                         Text( (widget.mediaList.length-3).toString(),
//                           style: AppTextStyle.getRegularStyle(
//                               color:AppColors.white, fontSize: AppFontSize.size_26),
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
