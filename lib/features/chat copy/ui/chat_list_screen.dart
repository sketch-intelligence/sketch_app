// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:rent_chicken/core/boilerplate/pagination/cubits/pagination_cubit.dart';
// import 'package:rent_chicken/core/constant/text_styles/font_size.dart';
// import 'package:rent_chicken/core/ui/screens/guest_screen.dart';
// import 'package:rent_chicken/core/ui/widgets/custom_text_form_field.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/data/model/conversation_model.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';
// import 'package:rent_chicken/features/chat/data/use_case/all_converstions_usae_case.dart';
// import 'package:rent_chicken/features/chat/widgets/chat_card.dart';
// import 'package:rent_chicken/translations.dart';
//
// import '../../../core/boilerplate/pagination/widgets/pagination_list.dart';
// import '../../../core/classes/cashe_helper.dart';
// import '../../../core/constant/app_colors/app_colors.dart';
// import '../../../core/constant/app_lottie/app_lottie.dart';
// import '../../../core/constant/text_styles/app_text_style.dart';
// import 'no_chats_screen.dart';
//
// class ChatListScreen extends StatefulWidget {
//   const ChatListScreen({Key? key,}) : super(key: key);
//
//   @override
//   State<ChatListScreen> createState() => _ChatListScreenState();
// }
//
// class _ChatListScreenState extends State<ChatListScreen> {
//   PaginationCubit? paginationCubit;
//   bool isSearchActive=false;
//   TextEditingController searchController=TextEditingController();
//
// @override
//   void initState() {
//     super.initState();
//     context.read<ChatCubit>().isLoading=false;
//     context.read<ChatCubit>().whenDone= () {
//       setState(() {});
//     };
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//          child: Scaffold(
//           body:CacheHelper.token == null
//               ? GuestScreen(subTitle:AppLocalizations.of(context)!.chats_with_farmers,)
//               : Stack(
//                children: [
//                 Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(AppLocalizations.of(context)!.chats,
//                           style:AppTextStyle.getSemiBoldStyle(
//                               color:AppColors.black14, fontSize: AppFontSize.size_16),),
//                         // InkWell(
//                         //   onTap:() {
//                         //     context.read<ChatCubit>().chatScreenClear();
//                         //     Navigation.push(const SupportChatScreen());
//                         //   },
//                         //   child: Container(
//                         //     decoration: BoxDecoration(
//                         //         border: Border.all(color: Colors.black),
//                         //         borderRadius: const BorderRadius.all(Radius.circular(4))),
//                         //     child:Padding(
//                         //       padding: const EdgeInsets.all(4.0),
//                         //       child: Row(
//                         //         children: [
//                         //           Text('Support',
//                         //             style: AppTextStyle.getSemiBoldStyle(
//                         //                 color:AppColors.black14, fontSize: AppFontSize.size_16),),
//                         //             const SizedBox(
//                         //                 height:25,
//                         //                 child: VerticalDivider(color: Colors.black)),
//                         //             SvgPicture.asset(
//                         //               "assets/icons/support.svg",
//                         //               width: 25,
//                         //               height: 25,
//                         //             ),
//                         //         ],
//                         //       ),
//                         //     )
//                         //   ),
//                         // ),
//                   ],
//                 ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: CustomTextFormField(
//                        onChanged: (String title) async {
//                          Future.delayed(const Duration(seconds: 1),() {
//                         paginationCubit?.getList();
//                         setState(() {});});
//                       },
//                       hintText: AppLocalizations.of(context)!.user_name,
//                       controller: searchController,
//                     ),
//                   ),
//                   Expanded(
//                     child: PaginationList<ConversationModel>(
//                       onCubitCreated: (cubit) {
//                         paginationCubit = cubit;
//                       },
//                       noDataWidget: const Center(child: NoChatScreen()) ,
//                       loadingWidget: Lottie.asset(loadingLottie),
//                       withPagination: true,
//                       repositoryCallBack: (model) {
//                         return GetAllConversationsUseCase(ChatRepository()).call(params:GetConversationsParams(request: model,keywords: searchController.text));
//                       },
//                       listBuilder: (list) {
//                         context.read<ChatCubit>().allConversationWidgetList=[];
//                         context.read<ChatCubit>().allConversationList=[];
//                         context.read<ChatCubit>().allConversationList=list;
//                         context.read<ChatCubit>().allConversationList.forEach((element) {
//                           context.read<ChatCubit>().allConversationWidgetList.add(ChatCard(
//                             whenBlockedDone: () {
//                               paginationCubit?.getList();
//                               setState(() {});
//                             },
//                             whenDone: () => setState(() {}),
//                             conversationModel: element,));
//                         });
//                         return context.read<ChatCubit>().allConversationList.isNotEmpty
//                             ? ListView.separated(
//                             separatorBuilder: (context, index) => const Divider(color: AppColors.grey7F, height: 25),
//                             physics: const BouncingScrollPhysics(),
//                             itemCount: context.read<ChatCubit>().allConversationWidgetList.length,
//                             itemBuilder: (context, index) {
//                               return context.read<ChatCubit>().allConversationWidgetList[index];
//                             })
//                             :  const Center(child: NoChatScreen());
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//                 // if(context.read<ChatCubit>().isLoading)
//                 // Positioned.fill(
//                 //   child: Container(
//                 //     alignment: Alignment.center,
//                 //     color: Colors.white30,
//                 //     child: const CupertinoActivityIndicator(
//                 //       color: Colors.black,
//                 //       radius: 35,
//                 //     ),),
//                 // )
//             ],
//           ),
//       ));
//     }
//   }
