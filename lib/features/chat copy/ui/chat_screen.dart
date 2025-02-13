// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:rent_chicken/core/boilerplate/pagination/cubits/pagination_cubit.dart';
// import 'package:rent_chicken/core/boilerplate/pagination/widgets/pagination_list.dart';
// import 'package:rent_chicken/core/classes/cashe_helper.dart';
// import 'package:rent_chicken/core/constant/text_styles/app_text_style.dart';
// import 'package:rent_chicken/core/constant/text_styles/font_size.dart';
// import 'package:rent_chicken/features/auth/data/model/login_model.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/data/model/conversation_model.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/use_case/get_messages_con_use_case.dart';
// import 'package:rent_chicken/features/chat/widgets/message_card.dart';
// import 'package:rent_chicken/features/chat/widgets/sent_message_widget.dart';
// import 'package:rent_chicken/features/chat/widgets/upload_image.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../core/constant/app_colors/app_colors.dart';
// import '../../../core/constant/app_lottie/app_lottie.dart';
// import '../../../core/socket/private_socket/private_socket_logic.dart';
// import '../data/repository/chat_repository.dart';
// import '../widgets/chat_app_bar.dart';
// import 'no_chats_screen.dart';
//
// class ChatScreen extends StatefulWidget {
//   final ConversationModel? conversationModel;
//   final LoginModel? vendorProfile;
//   final int? recieverId;
//   final bool fromVendor;
//   const ChatScreen(
//       {Key? key,
//       this.recieverId,
//       this.fromVendor = false,
//       this.vendorProfile,
//       this.conversationModel,})
//       : super(key: key);
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   PaginationCubit? paginationCubit;
//   ScrollController scrollController = ScrollController();
//   int? conversationId;
//   LoginModel? secondUser;
//
//   @override
//   void initState() {
//     super.initState();
//     context.read<ChatCubit>().chatScreenClear();
//     if (widget.conversationModel != null) conversationId = widget.conversationModel!.id;
//     if (widget.conversationModel != null) {
//       secondUser = ((CacheHelper.userID ?? '') == (widget.conversationModel?.userSender?.id ?? ''))
//           ? widget.conversationModel!.userReceiver
//           : widget.conversationModel!.userSender;
//     }
//     if (widget.vendorProfile != null) {
//       if (widget.vendorProfile!.conversationId! > 0) conversationId = widget.vendorProfile!.conversationId;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Stack(
//               children: [
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
//                   if (conversationId != null)
//                     PrivateSocket(
//                       conversationId: conversationId!,
//                       callBackSuccess: (value) {
//                         if (value) {
//                           setState(() {});
//                           scrollController.animateTo(
//                             0.0,
//                             curve: Curves.easeOut,
//                             duration: const Duration(milliseconds: 300),
//                           );
//                         }
//                       },
//                     ),
//                   (widget.conversationModel != null)
//                       ? ChatAppBar(
//                           userId:  ((CacheHelper.userID ?? '')==widget.conversationModel!.firstUser!)
//                               ? widget.conversationModel!.secondUser!
//                               : widget.conversationModel!.firstUser!,
//                           name:  ((CacheHelper.userID ?? '')==widget.conversationModel!.firstUser!)
//                               ? widget.conversationModel!.secondUsername!
//                               : widget.conversationModel!.firstUsername!,
//                           photo: ((CacheHelper.userID ?? '')==widget.conversationModel!.firstUser!)
//                                 ? widget.conversationModel!.secondPhoto!
//                                     :widget.conversationModel!.firstPhoto!,
//                         )
//                       : ChatAppBar(
//                           userId: widget.vendorProfile!.id!,
//                           name: widget.vendorProfile?.username ?? '',
//                           photo: widget.vendorProfile?.photo ?? '',
//                         ),
//                   if (((widget.conversationModel?.id ?? 0) > 0) || ((widget.vendorProfile?.conversationId ?? 0) > 0))
//                     Expanded(
//                       child: PaginationList<LastMessageModel>(
//                         onCubitCreated: (cubit) {
//                           paginationCubit = cubit;
//                         },
//                         loadingWidget: Lottie.asset(loadingLottie),
//                         withPagination: true,
//                         repositoryCallBack: (model) {
//                           return GetMessagesUseCase(ChatRepository())
//                               .call(params: GetMessagesParams(request: model, conversationId: conversationId ?? 0));
//                         },
//                         listBuilder: (list) {
//                           conversationId = list[0].conversationId;
//                           context.read<ChatCubit>().msgList = list;
//                           context.read<ChatCubit>().widgetList = [];
//                           context.read<ChatCubit>().msgList.forEach((element) {
//                             context.read<ChatCubit>().widgetList.add(MessageCardWidget(
//                                 key: ValueKey(element.id),
//                                 whenDone: () => setState(() {}),
//                                 messageModel: element,
//                                 fromReciever: CacheHelper.userID != element.sender));
//                           });
//                           return ListView.separated(
//                               reverse: true,
//                               controller: scrollController,
//                               padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 24),
//                               separatorBuilder: (context, index) => const SizedBox(height: 12),
//                               physics: const BouncingScrollPhysics(),
//                               itemCount: context.read<ChatCubit>().widgetList.length,
//                               itemBuilder: (context, index) {
//                                 return context.read<ChatCubit>().widgetList[index];
//                               });
//                         },
//                       ),
//                     ),
//                   if ((widget.conversationModel == null) && ((widget.vendorProfile?.conversationId == 0) && context.read<ChatCubit>().msgList.isNotEmpty))
//                     Expanded(
//                       child: ListView.separated(
//                           reverse: true,
//                           controller: scrollController,
//                           padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 24),
//                           separatorBuilder: (context, index) => const SizedBox(height: 12),
//                           physics: const BouncingScrollPhysics(),
//                           itemCount: context.read<ChatCubit>().widgetList.length,
//                           itemBuilder: (context, index) {
//                             return context.read<ChatCubit>().widgetList[index];
//                           }),
//                     ),
//                   if ((widget.conversationModel == null)&&((widget.vendorProfile?.conversationId == 0) && context.read<ChatCubit>().msgList.isEmpty))
//                     const NoChatScreen(),
//                   if (context.read<ChatCubit>().mediaList.isNotEmpty)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                       child: UploadMedia(
//                         onTap: () {
//                           setState(() {});
//                         },
//                       ),
//                     ),
//                   (widget.conversationModel?.isBlocked??false)
//                   ? Container(
//                     height: 60,
//                     width: double.infinity,
//                     color: AppColors.grey9A,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Center(
//                         child: Text('This person isn\'t available right now',
//                           style: AppTextStyle.getSemiBoldStyle(
//                               color:AppColors.black14, fontSize: AppFontSize.size_16),
//                         ),
//                       ),
//                     ),
//                   )
//                   : SendMessageWidget(
//                       whenDone: () => setState(() {}),
//                       callBackSuccess: (value) {
//                         if (value) {
//                           setState(() {});
//                           if (scrollController.hasClients ) {
//                             scrollController.animateTo(
//                               0.0,
//                               curve: Curves.easeOut,
//                               duration: const Duration(milliseconds: 300),
//                             );
//                           }
//                         }
//                       },
//                       recieverId: (widget.conversationModel != null)
//                           ? (CacheHelper.userID ?? '') != widget.conversationModel!.firstUser
//                               ? widget.conversationModel!.firstUser!
//                               : widget.conversationModel!.secondUser!
//                           : widget.recieverId!,
//                       callBackConversationId: (value) {
//                         conversationId = value;
//                         setState(() {});
//                       }),
//                 ]),
//       ],
//     )));
//   }
// }
