// import 'package:animated_snack_bar/animated_snack_bar.dart';
// import 'package:emoji_keyboard_flutter/emoji_keyboard_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rent_chicken/core/boilerplate/create_model/widgets/create_model.dart';
// import 'package:rent_chicken/core/classes/cashe_helper.dart';
// import 'package:rent_chicken/core/constant/app_colors/app_colors.dart';
// import 'package:rent_chicken/core/constant/app_padding/app_padding.dart';
// import 'package:rent_chicken/core/ui/dialogs/dialogs.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_cubit.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';
// import 'package:rent_chicken/features/chat/data/use_case/send_message_use_caes.dart';
//
// import '../../../core/classes/keys.dart';
// import '../../../core/constant/app_icons/app_icons.dart';
// import '../../../core/ui/widgets/custom_text_form_field.dart';
// import 'message_card.dart';
// import 'pop_up_attachment.dart';
//
// class SendMessageWidget extends StatefulWidget {
//   final int recieverId;
//
//   final ValueChanged<bool> callBackSuccess;
//   final ValueChanged<int> callBackConversationId;
//   final VoidCallback whenDone;
//   const SendMessageWidget(
//       {Key? key,
//       required this.callBackConversationId,
//       required this.recieverId,
//
//       required this.callBackSuccess,
//       required this.whenDone})
//       : super(key: key);
//
//   @override
//   State<SendMessageWidget> createState() => _SendMessageWidgetState();
// }
//
// class _SendMessageWidgetState extends State<SendMessageWidget>  {
//   bool isEmojiShow = false;
//   TextEditingController textEditingController=TextEditingController();
//   FocusNode myFocusNode = FocusNode();
//   int? idLocal;
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(microseconds: 2), () => FocusScope.of(context).unfocus());
//     myFocusNode.addListener(() {
//       if (myFocusNode.hasFocus) {
//         isEmojiShow = false;
//         setState(() {});
//       } else {}
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (isEmojiShow == true) {
//           isEmojiShow = false;
//           setState(() {});
//           return false;
//         } else {
//           return true;
//         }
//       },
//       child: Column(
//         children: [
//           Form(
//             key: Keys.formKey,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: AppPaddingSize.padding_16, vertical: AppPaddingSize.padding_12),
//               child: SizedBox(
//                 // height: 60,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         child: CustomTextFormField(
//                           controller: textEditingController,
//                           hintText: 'Message',
//                           // suffixIcon: Padding(
//                           //   padding: const EdgeInsetsDirectional.only(end: 4.0),
//                           //   child: SizedBox(
//                           //     width: 58,
//                           //     child: Row(
//                           //       mainAxisAlignment: MainAxisAlignment.end,
//                           //       children: [
//                           //         PopUpAttachment(
//                           //           whenDone: () => widget.whenDone,
//                           //         ),
//                           //         InkWell(
//                           //             onTap: () {
//                           //               context.read<ChatCubit>()
//                           //                   .selectImage(imageSource: ImageSource.camera, whenDone: widget.whenDone);
//                           //             },
//                           //             child: Padding(
//                           //               padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                           //               child: SvgPicture.asset(cameraIcon),
//                           //             ),),
//                           //       ],
//                           //     ),
//                           //   ),
//                           // ),
//                           // prefixIcon: InkWell(
//                           //     onTap: () {
//                           //       isEmojiShow = true;
//                           //       setState(() {});
//                           //       FocusScope.of(context).requestFocus(FocusNode());
//                           //     },
//                           //     child: Icon(Icons.emoji_emotions_outlined, color: AppColors.primary)),
//                           //onChanged: (p0) => print(p0),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 2,
//                     ),
//                     (context.read<ChatCubit>().mediaList.isEmpty)
//                         ? CreateModel(
//                             withValidation: true,
//                             onTap: () {
//                               if(textEditingController.text.isEmpty){
//                                 Dialogs.showErrorSnackBar(
//                                   message: 'Message must be filled',
//                                   typeSnackBar: AnimatedSnackBarType.warning,
//                                 );
//                                 return false;
//                               }
//                               else{
//                               return true;}
//                             },
//                             onSuccess: (LastMessageModel model) async {
//                               context.read<ChatCubit>().msgList.insert(0, model);
//                               context.read<ChatCubit>().widgetList.insert(
//                                   0,
//                                   MessageCardWidget(
//                                     whenDone: () => setState(() {}),
//                                     messageModel: model,
//                                     fromReciever: CacheHelper.userID == model.userSender?.id,
//                                   ));
//                               widget.callBackSuccess(true);
//                               widget.callBackConversationId(model.conversationId!);
//                               textEditingController.text='';
//                             },
//                             useCaseCallBack: (model) {
//                               return SendMessageUseCase(ChatRepository()).call(
//                                   params: ChatParams(
//                                       senderId: CacheHelper.userID??0,
//                                       recieverId: widget.recieverId,
//                                       // recieverId: ((CashHelper.getData(key:userId)??'')==(widget.conversationModel.userSender?.id??''))?
//                                       // widget.conversationModel.userReceiver?.id??0: widget.conversationModel.userSender?.id??0,
//                                       msg: textEditingController.text,
//                                       photos: [],
//                                       videos: []));
//                             },
//                             child: Container(
//                               width: 50,
//                               height: 50,
//                               decoration:  BoxDecoration(
//                                   color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(4))),
//                               child: const Padding(
//                                 padding: EdgeInsets.all(13.0),
//                                 child: Icon(Icons.send_rounded, color: Colors.white, size: 24),
//                               ),
//                             ))
//                         : InkWell(
//                             onTap: () {
//                               if(context.read<ChatCubit>().mediaList.isEmpty&&textEditingController.text==''){
//                                 Dialogs.showErrorSnackBar(
//                                   message: 'Message must be filled',
//                                   typeSnackBar: AnimatedSnackBarType.warning,
//                                 );
//                               }
//                               else{
//                               idLocal = context.read<ChatCubit>().msgList.length;
//                               LastMessageModel messageModel = LastMessageModel(
//                                 idLocal: idLocal,
//                                 message: textEditingController.text,
//                                 mediaList: context.read<ChatCubit>().mediaList,
//                                 sender: CacheHelper.userID,
//                                 receiver: widget.recieverId,
//                               );
//                               context.read<ChatCubit>().msgList.insert(0, messageModel);
//                               MessageCardWidget messageCard = MessageCardWidget(
//                                 idLocal: messageModel.idLocal,
//                                 key: const ValueKey('2'),
//                                 messageModel: messageModel,
//                                 fromReciever: false,
//                                 whenDone: () {},
//                               );
//                               context.read<ChatCubit>().widgetList.insert(0, messageCard);
//                               context.read<ChatCubit>().mediaList = [];
//                               setState(() {});
//                               widget.whenDone();
//                               textEditingController.clear();
//                             }},
//                             child: Container(
//                               width: 50,
//                               height: 50,
//                               decoration: const BoxDecoration(
//                                   color: AppColors.greyDD, borderRadius: BorderRadius.all(Radius.circular(4))),
//                               child: const Padding(
//                                 padding: EdgeInsets.all(13.0),
//                                 child: Icon(Icons.send_rounded, color: Colors.white, size: 24),
//                               ),
//                             ),
//                           )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Align(
//           //   alignment: Alignment.bottomCenter,
//           //   child: EmojiKeyboard(
//           //       emotionController: textEditingController,
//           //       emojiKeyboardHeight: 400,
//           //       showEmojiKeyboard: isEmojiShow,
//           //       darkMode: true),
//           // ),
//         ],
//       ),
//     );
//   }
// }
