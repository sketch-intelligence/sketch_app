// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/constant/app_theme/app_styles.dart';
//
// class BasePhotoChatWidget extends StatelessWidget {
//   final Widget child;
//   final List<T> mediaList;
//   const BasePhotoChatWidget({Key? key, required this.child, required this.mediaList}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//       return (mediaList.length<=4 )
//         ? Wrap(
//       runSpacing: 8,
//       spacing: 9,
//       children: List.generate(
//         mediaList.length,
//             (index) => child,
//       ),
//     )
//         : Wrap(
//         runSpacing: 8,
//         spacing: 9,
//         children: List.generate(
//           4,
//               (index) => InkWell(
//             onTap: () {
//               context.read<ChatCubit>().networkPreviewMediaMessage=widget.messageModel;
//               context.read<ChatCubit>().isShowPreview=true;
//               widget.whenDone();
//               Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewPhotoChat(
//                 mediaList: mediaList,
//                 whenDone:(){} ,
//                 chatController: context.read<ChatCubit>(),
//               ),));
//             } ,
//             child: Stack(
//               children: [
//                child,
//                 if(index==3)
//                   Container(
//                     height: 135.h,
//                     width: 110.w,
//                     color: Colors.black.withOpacity(0.3),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.add,color: Colors.white),
//                         Text( (mediaList.length-3).toString(),
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
