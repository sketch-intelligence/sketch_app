// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/classes/cashe_helper.dart';
// import 'package:rent_chicken/core/utils/Navigation/Navigation.dart';
// import 'package:rent_chicken/core/utils/functions/date_function.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/data/model/conversation_model.dart';
// import '../../../core/constant/app_colors/app_colors.dart';
// import '../../../core/constant/text_styles/app_text_style.dart';
// import '../../../core/constant/text_styles/font_size.dart';
// import '../../store/widgets/cover_photo_widget.dart';
// import '../ui/chat_screen.dart';
// import 'bottom_sheet_chat.dart';
//
// class ChatCard extends StatefulWidget {
//   final ConversationModel conversationModel;
//
//   final Function() whenDone;
//   final Function()? whenBlockedDone;
//   const ChatCard({Key? key,this.whenBlockedDone, required this.conversationModel, required this.whenDone, })
//       : super(key: key);
//
//   @override
//   State<ChatCard> createState() => _ChatCardState();
// }
//
// class _ChatCardState extends State<ChatCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               context.read<ChatCubit>().chatScreenClear();
//               Navigation.push( ChatScreen(
//                 conversationModel: widget.conversationModel,
//               ))?.then((value) => widget.whenDone());
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12.0),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     height: 60,
//                     width: 60,
//                     child: CoverPhotoWidget(
//                       photoUrl:(CacheHelper.userID)==widget.conversationModel.firstUser!
//                           ? widget.conversationModel.secondPhoto ?? ''
//                           : widget.conversationModel.firstPhoto ?? '',
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8.w,
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 320.w,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   (CacheHelper.userID ?? '')==widget.conversationModel.firstUser!
//                                        ?widget.conversationModel.secondUsername??''
//                                        :widget.conversationModel.firstUsername??'',
//                                   style:AppTextStyle.getSemiBoldStyle(
//                                         color: AppColors.black14, fontSize: AppFontSize.size_14) ,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                               if (widget.conversationModel.lastMessageModel?.createdAt != null)
//                                 Text(GetDateTime.getDate(dateTimeValue: widget.conversationModel.lastMessageModel?.createdAt ?? DateTime(2024),
//                                   ),
//                                   style: AppTextStyle.getRegularStyle(
//                                     color: AppColors.black14, fontSize: AppFontSize.size_13)
//                                 ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 11.h,
//                         ),
//                         (widget.conversationModel.lastMessageModel?.message?.startsWith('<div>') ?? false)
//                             ? Html(data: widget.conversationModel.lastMessageModel?.message)
//                             : Text( widget.conversationModel.lastMessageModel?.message?.isNotEmpty??false
//                                 ? widget.conversationModel.lastMessageModel?.message ?? '':'attachment',
//                                 style:AppTextStyle.getSemiBoldStyle(
//                                 color: AppColors.black14, fontSize: AppFontSize.size_12),
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                               ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: AlignmentDirectional.topEnd,
//           child: BottomSheetChat(
//             isBlocked: widget.conversationModel.isBlocked,
//             whenBlockedDone: () {
//               if(widget.whenBlockedDone!=null)widget.whenBlockedDone!();
//             },
//             userName: (CacheHelper.userID) != widget.conversationModel.firstUser
//                 ? widget.conversationModel.firstUsername!
//                 : widget.conversationModel.secondUsername!,
//             secondId: (CacheHelper.userID) != widget.conversationModel.firstUser
//                 ? widget.conversationModel.firstUser!
//                 : widget.conversationModel.secondUser!,
//             conversationId: widget.conversationModel.id!,
//             whenDone: () => widget.whenDone(),
//             isSuccess: (value) {
//               context.read<ChatCubit>().allConversationWidgetList.remove(widget.conversationModel);
//               context.read<ChatCubit>().allConversationList.remove(widget.conversationModel);
//               widget.whenDone();
//             },
//           ),
//         ),
//         // const SizedBox(
//         //   width: 4,
//         // )
//       ],
//     );
//   }
// }
