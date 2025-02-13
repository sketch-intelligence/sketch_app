// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:rent_chicken/features/auth/data/model/login_model.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/ui/base_chat_screen.dart';
// import 'package:rent_chicken/features/chat/widgets/chat_app_bar.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../core/boilerplate/get_model/widgets/get_model.dart';
// import '../data/model/conversation_model.dart';
// import '../data/repository/chat_repository.dart';
// import '../data/use_case/get_support_id.dart';
// import '../data/use_case/get_support_usecase.dart';
//
// class SupportChatScreen extends StatefulWidget {
//   const SupportChatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SupportChatScreen> createState() => _SupportChatScreenState();
// }
//
// class _SupportChatScreenState extends State<SupportChatScreen> {
//   int? secondId;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return secondId == null
//         ? SafeArea(
//             child: Scaffold(
//               body: Column(
//                 children: [
//                   ChatAppBar(
//                     isSupport: true,
//                     userId: context.read<ChatCubit>().supportConversationId ?? 0,
//                     name: 'Supporter',
//                     photo: '',
//                     photoWidget: SvgPicture.asset(
//                       "assets/icons/support.svg",
//                       width: 30,
//                       height: 30,
//                     ),
//                   ),
//                   GetModel(
//                       onError: () {},
//                       loading: ListView.separated(
//                         shrinkWrap: true,
//                         padding:
//                             const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
//                         separatorBuilder: (context, index) =>
//                             const SizedBox(height: 15),
//                         itemCount: 8,
//                         itemBuilder: (context, _) {
//                           return Shimmer.fromColors(
//                               baseColor: Colors.grey.withOpacity(0.5),
//                               highlightColor: Colors.grey.shade50,
//                               enabled: true,
//                               child: SizedBox(
//                                 height: 80.h,
//                                 width: 173.w,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(4.0),
//                                   ),
//                                 ),
//                               ));
//                         },
//                       ),
//                       onCubitCreated: (cubit) {},
//                       onSuccess: (LoginModel model) {
//                         secondId = model.id;
//                         setState(() {});
//                       },
//                       useCaseCallBack: () {
//                         return GetSupportIdUseCase(ChatRepository())
//                             .call(params: GetSupportIdParams());
//                       },
//                       modelBuilder: (model) {
//                         return const SizedBox();
//                       }),
//                 ],
//               ),
//             ),
//           )
//         : BaseChatScreen(
//             widgetChatAppBar: SvgPicture.asset(
//               "assets/icons/support.svg",
//               width: 30,
//               height: 30,
//             ),
//             conversationId: context.read<ChatCubit>().supportConversationId,
//             secondId: secondId!,
//             secondName: 'Supporter',
//             secondPhoto: '',
//             widgetChat: GetModel(
//                 errorWidget: const SizedBox(),
//                 onCubitCreated: (cubit) {},
//                 onSuccess: (ConversationModel model) {
//                   context.read<ChatCubit>().supportConversationId = model.id;
//                 },
//                 useCaseCallBack: () {
//                   return GetSupportUseCase(ChatRepository()).call(params: GetSupportMsgParams());
//                 },
//                 modelBuilder: (model) {
//                   return const SizedBox();
//                 }),
//           );
//   }
// }
