// import 'package:animated_snack_bar/animated_snack_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rent_chicken/core/boilerplate/create_model/widgets/create_model.dart';
// import 'package:rent_chicken/core/constant/app_colors/app_colors.dart';
// import 'package:rent_chicken/core/constant/text_styles/app_text_style.dart';
// import 'package:rent_chicken/core/utils/Navigation/Navigation.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';
// import 'package:rent_chicken/translations.dart';
// import '../../../core/constant/app_icons/app_icons.dart';
// import '../../../core/constant/text_styles/font_size.dart';
// import '../../../core/ui/dialogs/dialogs.dart';
// import '../data/use_case/delete_conversation_usecase.dart';
//
// class BottomSheetChat extends StatelessWidget {
//   final String userName;
//   final int conversationId;
//   final int secondId;
//   final bool isBlocked;
//   final ValueChanged<bool>? isSuccess;
//     final Function() whenDone;
//     final Function()? whenBlockedDone;
//   const BottomSheetChat({Key? key,this.whenBlockedDone,required this.isBlocked,required this.conversationId,required this.whenDone, this.isSuccess, required this.secondId, required this.userName}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return Stack(
//                 children: [
//                   Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: AppColors.primary),
//                         borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(32),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: const Icon(Icons.close_rounded,)),
//                             CreateModel(
//                               onSuccess: (model2) async {
//                                 context.read<ChatCubit>().isLoading=false;
//                                   Navigation.pop();
//                                   isSuccess!(true);
//                                 Dialogs.showErrorSnackBar(
//                                   message: AppLocalizations.of(context)!.chat_delete_success,
//                                   typeSnackBar: AnimatedSnackBarType.success,
//                                 );
//                               },
//                               useCaseCallBack: (model2) {
//                                 context.read<ChatCubit>().isLoading=true;
//                               //  whenDone();
//                                 return DeleteConversationUseCase(ChatRepository()).call(params: DeleteConversationParams(conversationId: conversationId));
//                               },
//                               withValidation: false,
//                               child: Row(
//                                 children: [
//                                   SvgPicture.asset(deleteIcon, width: 20.w, height: 20.h),
//                                   SizedBox(
//                                     width: 7.w,
//                                   ),
//                                   Text(AppLocalizations.of(context)!.delete_conversation,
//                                     style: AppTextStyle.getRegularStyle(
//                                         color:AppColors.black14, fontSize: AppFontSize.size_14),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 16.h,
//                             ),
//                             const Divider(
//                               color: AppColors.greyDD,
//                               height: 1,
//                             ),
//                             SizedBox(
//                               height: 16.h,
//                             ),
//                             SizedBox(
//                               height: 16.h,
//                             ),
//                           ],
//                         ),
//                       )),
//                 ],
//               );
//             });
//       },
//       child: const Padding(
//         padding: EdgeInsetsDirectional.only(start: 12),
//         child: Icon(Icons.more_vert_rounded),
//       ));
//   }
// }
