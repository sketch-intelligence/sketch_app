// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/constant/app_colors/app_colors.dart';
// import 'package:rent_chicken/core/constant/text_styles/font_size.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../core/constant/text_styles/app_text_style.dart';
// import '../../../core/utils/functions/date_function.dart';
// import 'asset_message_card.dart';
// import 'network_photos_chat_widget.dart';
//
// class MessageCardWidget extends StatefulWidget {
//   final bool fromReciever ;
//    LastMessageModel? messageModel ;
//   final VoidCallback whenDone;
//   final int? idLocal ;
//    MessageCardWidget({Key? key, required this.fromReciever, required this.messageModel, required this.whenDone, this.idLocal}) : super(key: key);
//
//   @override
//   State<MessageCardWidget> createState() => _MessageCardWidgetState();
// }
//
// class _MessageCardWidgetState extends State<MessageCardWidget> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       ((widget.messageModel!.mediaList?.isNotEmpty??false)&&( widget.messageModel!.idLocal!=null))
//         ? AssetsMessageCard(
//            whenDone:() => widget.whenDone() ,
//             idLocal: widget.messageModel!.idLocal!,
//             messageModel:widget.messageModel! ,)
//         : SizedBox(
//           width: 0.9.sw,
//           child: Row(
//           mainAxisAlignment:(!widget.fromReciever)? MainAxisAlignment.end:MainAxisAlignment.start,
//           children: [
//             if(!widget.fromReciever) SizedBox(width: 30.w,),
//             // if(!widget.fromReciever)
//             //   Padding(
//             //     padding: const EdgeInsetsDirectional.only(end: 10.0),
//             //     child: Icon(Icons.more_horiz_rounded,color: AppColors.grayXLight),),
//             Flexible(
//               child: Container(
//                 constraints: BoxConstraints(
//                   maxWidth:0.9.sw,
//                 ),
//                 decoration: BoxDecoration(
//                   color: widget.fromReciever? Colors.white : AppColors.primary,
//                   border: Border.all(color: Colors.transparent),
//                   borderRadius: BorderRadius.only(
//                     bottomRight:const Radius.circular(16),
//                     bottomLeft:const Radius.circular(16),
//                     topLeft:widget.fromReciever?const Radius.circular(0):const Radius.circular(16),
//                     topRight:widget.fromReciever?const Radius.circular(16):const Radius.circular(0),
//                   )
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       if ((widget.messageModel!.photos?.isNotEmpty ?? false) || (widget.messageModel!.videos?.isNotEmpty ?? false))
//                         NetworkPhotoChatWidget(
//                           whenDone:() => widget.whenDone() ,
//                           messageModel: widget.messageModel!,),
//                       (widget.messageModel!.message?.startsWith('<div>')??false)
//                         ? Html(data:widget.messageModel!.message,
//                       onLinkTap: (url, attributes, element) async {
//                         final Uri htmlUrl = Uri.parse(url?? '');
//                         if (!await launchUrl(htmlUrl)) {
//                         throw Exception('Could not launch $htmlUrl');
//                         }
//                       },
//                       )
//                         : Text(widget.messageModel!.message??'',
//                           style: AppTextStyle.getRegularStyle(
//                              color:widget.fromReciever ? Colors.black : Colors.white , fontSize: AppFontSize.size_14),),
//                       // if(!widget.fromReciever)
//                        if(widget.messageModel!.createdAt!=null)
//                         Text(GetDateTime.getDate(dateTimeValue: widget.messageModel!.createdAt!),
//                           style:AppTextStyle.getRegularStyle(
//                               color:widget.fromReciever?Colors.black:Colors.white, fontSize: AppFontSize.size_12),),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           // if(widget.fromReciever)
//           //   Padding(
//           //   padding: const EdgeInsetsDirectional.only(start: 10.0),
//           //   child: Icon(Icons.more_horiz_rounded,color: AppColors.grayXLight),
//           // ),
//           if(widget.fromReciever)SizedBox(width: 30.w,),
//         ],
//       ),
//     );
//   }
// }
