// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/boilerplate/pagination/widgets/pagination_list.dart';
// import 'package:rent_chicken/core/classes/cashe_helper.dart';
// import 'package:rent_chicken/core/socket/private_socket/private_socket_logic.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/widgets/upload_image.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../core/boilerplate/get_model/widgets/get_model.dart';
// import '../../../core/boilerplate/pagination/cubits/pagination_cubit.dart';
// import '../data/model/conversation_model.dart';
// import '../data/model/last_message_model.dart';
// import '../data/repository/chat_repository.dart';
// import '../data/use_case/get_messages_con_use_case.dart';
// import '../data/use_case/get_support_usecase.dart';
// import '../widgets/chat_app_bar.dart';
// import '../widgets/message_card.dart';
// import '../widgets/sent_message_widget.dart';
// import 'no_chats_screen.dart';
//
// class BaseChatScreen extends StatefulWidget {
//   final Widget widgetChat;
//   final Widget? widgetChatAppBar;
//   final int? conversationId;
//   final int secondId;
//   final String secondName;
//   final String secondPhoto;
//
//   const BaseChatScreen(
//       {Key? key,
//       required this.conversationId,
//       required this.widgetChat,
//       required this.secondId,
//       required this.secondName,
//       required this.secondPhoto, this.widgetChatAppBar,})
//       : super(key: key);
//
//   @override
//   State<BaseChatScreen> createState() => _BaseChatScreenState();
// }
//
// class _BaseChatScreenState extends State<BaseChatScreen> {
//   int? conversationId;
//   bool getSupport=true;
//   PaginationCubit? paginationCubit;
//   ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     conversationId = context.read<ChatCubit>().supportConversationId;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Stack(
//           children: [
//             Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               if ((context.read<ChatCubit>().supportConversationId ?? 0) > 0)
//                 PrivateSocket(
//                   conversationId: context.read<ChatCubit>().supportConversationId!,
//                   callBackSuccess: (value) {
//                     if (value) {
//                       setState(() {});
//                       scrollController.animateTo(
//                         0.0,
//                         curve: Curves.easeOut,
//                         duration: const Duration(milliseconds: 300),
//                       );
//                     }
//                   },
//                 ),
//                 ChatAppBar(
//                   isSupport: true,
//                 userId: context.read<ChatCubit>().supportConversationId ??0,
//                 name: widget.secondName,
//                 photo: widget.secondPhoto,
//                   photoWidget: widget.widgetChatAppBar,
//               ),
//               if ((context.read<ChatCubit>().supportConversationId ?? 0) > 0)
//                 Expanded(
//                   child: PaginationList<LastMessageModel>(
//                     onCubitCreated: (cubit) {
//                       paginationCubit = cubit;
//                     },
//                     loadingWidget: ListView.separated(
//                       padding:
//                           const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
//                       separatorBuilder: (context, index) =>
//                           const SizedBox(height: 15),
//                       itemCount: 8,
//                       itemBuilder: (context, _) {
//                         return Shimmer.fromColors(
//                             baseColor: Colors.grey.withOpacity(0.5),
//                             highlightColor: Colors.grey.shade50,
//                             enabled: true,
//                             child: SizedBox(
//                               height: 80.h,
//                               width: 173.w,
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4.0),
//                                 ),
//                               ),
//                             ));
//                       },
//                     ),
//                     withPagination: true,
//                     repositoryCallBack: (model) {
//                       return GetMessagesUseCase(ChatRepository()).call(
//                           params: GetMessagesParams(
//                               request: model,
//                               conversationId:  context.read<ChatCubit>().supportConversationId ?? 0));
//                     },
//                     listBuilder: (list) {
//                       conversationId = list[0].conversationId;
//                       context.read<ChatCubit>().msgList = list;
//                       context.read<ChatCubit>().widgetList = [];
//                       for (var element in context.read<ChatCubit>().msgList) {
//                         context.read<ChatCubit>().widgetList.add(MessageCardWidget(
//                             key: ValueKey(element.id),
//                             whenDone: () => setState(() {}),
//                             messageModel: element,
//                             fromReciever: CacheHelper.userID != element.sender));
//                       }
//                       return ListView.separated(
//                           reverse: true,
//                           controller: scrollController,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 23, horizontal: 24),
//                           separatorBuilder: (context, index) =>
//                               const SizedBox(height: 12),
//                           physics: const BouncingScrollPhysics(),
//                           itemCount: context.read<ChatCubit>().widgetList.length,
//                           itemBuilder: (context, index) {
//                             return context.read<ChatCubit>().widgetList[index];
//                           });
//                     },
//                   ),
//                 ),
//               if ((context.read<ChatCubit>().supportConversationId == 0) && context.read<ChatCubit>().msgList.isNotEmpty)
//                 Expanded(
//                   child: ListView.separated(
//                       reverse: true,
//                       controller: scrollController,
//                       padding:
//                           const EdgeInsets.symmetric(vertical: 23, horizontal: 24),
//                       separatorBuilder: (context, index) =>
//                           const SizedBox(height: 12),
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: context.read<ChatCubit>().widgetList.length,
//                       itemBuilder: (context, index) {
//                         return context.read<ChatCubit>().widgetList[index];
//                       }),
//                 ),
//               if (context.read<ChatCubit>().supportConversationId == 0 && context.read<ChatCubit>().msgList.isEmpty)
//                 const NoChatScreen(),
//               if (context.read<ChatCubit>().mediaList.isNotEmpty)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                   child: UploadMedia(
//                     onTap: () {
//                       setState(() {});
//                     },
//                   ),
//                 ),
//              //todo remove this widget to common widget
//              // if(conversationId==0)
//                // widget.widgetChat,
//               if(context.read<ChatCubit>().supportConversationId==null&&getSupport)
//               Expanded(
//                 child: GetModel(
//                       onError: (){
//                         context.read<ChatCubit>().supportConversationId=0;
//                         getSupport=false;
//                         setState(() {});
//                       },
//                     loading:ListView.separated(
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
//                       separatorBuilder: (context, index) => const SizedBox(height: 15),
//                       itemCount: 8,
//                       itemBuilder: (context, _) {
//                         return Shimmer.fromColors(
//                             baseColor: Colors.grey.withOpacity(0.5),
//                             highlightColor: Colors.grey.shade50,
//                             enabled: true,
//                             child: SizedBox(
//                               height: 80.h,
//                               width: 173.w,
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4.0),
//                                 ),
//                               ),
//                             ));
//                       },
//                     ),
//                     onCubitCreated: (cubit) {},
//                     onSuccess: (ConversationModel model) {
//                       context.read<ChatCubit>().supportConversationId=model.id!;
//                       setState(() {});
//                     },
//                     useCaseCallBack: () {
//                       return GetSupportUseCase(ChatRepository()).call(params: GetSupportMsgParams()); },
//                     modelBuilder: ( model) {
//                       return const SizedBox();
//                     }),
//               ),
//               SendMessageWidget(
//                   whenDone: () => setState(() {}),
//                   callBackSuccess: (value) {
//                     if (value) {
//                       setState(() {});
//                       if (scrollController.hasClients) {
//                         scrollController.animateTo(
//                           0.0,
//                           curve: Curves.easeOut,
//                           duration: const Duration(milliseconds: 300),
//                         );
//                       }
//                     }
//                   },
//                   recieverId:widget.secondId,
//                   callBackConversationId: (value) {
//                     conversationId = value;
//                     context.read<ChatCubit>().supportConversationId=value;
//                     setState(() {});
//                   }),
//             ]),
//       ],
//     )));
//   }
// }
