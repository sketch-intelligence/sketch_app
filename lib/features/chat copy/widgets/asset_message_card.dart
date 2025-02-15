// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rent_chicken/core/boilerplate/get_model/cubits/get_model_cubit.dart';
// import 'package:rent_chicken/core/classes/cashe_helper.dart';
// import 'package:rent_chicken/core/constant/app_colors/app_colors.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/repository/chat_repository.dart';
// import 'package:rent_chicken/features/chat/data/use_case/send_message_use_caes.dart';
// import 'package:rent_chicken/features/chat/widgets/message_card.dart';

// import '../../../core/boilerplate/get_model/widgets/get_model.dart';
// import '../cubit/chat_cubit.dart';
// import 'assets_message_widget.dart';

// class AssetsMessageCard extends StatefulWidget {
//   final LastMessageModel messageModel;
//   final int idLocal;

//   final Function whenDone;
//   const AssetsMessageCard(
//       {super.key,
//       required this.messageModel,
//       required this.idLocal,
//       required this.whenDone});

//   @override
//   State<AssetsMessageCard> createState() => _AssetsMessageCardState();
// }

// class _AssetsMessageCardState extends State<AssetsMessageCard> {
//   int? index;
//   bool isLoading = true;
//   List<File> imagesList = [];
//   List<File> videosList = [];
//   GetModelCubit? _getModelCubit;

//   @override
//   void initState() {
//     super.initState();
//     for (var element in widget.messageModel.mediaList!) {
//       element.isPhoto
//           ? imagesList.add(element.file)
//           : videosList.add(element.file);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetModel(
//         withoutCenterLoading: true,
//         key: ValueKey(widget.messageModel.id ??
//             (widget.messageModel.mediaList!.length + 1)),
//         errorWidget: Align(
//           alignment: AlignmentDirectional.topEnd,
//           child: Container(
//             decoration: BoxDecoration(
//                 color: AppColors.primary,
//                 border: Border.all(color: Colors.transparent),
//                 borderRadius: const BorderRadius.only(
//                   bottomRight: Radius.circular(16),
//                   bottomLeft: Radius.circular(16),
//                   topLeft: Radius.circular(16),
//                   topRight: Radius.circular(0),
//                 )),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
//               child: Column(
//                 children: [
//                   const Text(
//                     'upload failed ,Try again',
//                     style: TextStyle(
//                         fontSize: 11,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white),
//                   ),
//                   IconButton(
//                       onPressed: () {
//                         _getModelCubit?.getModel();
//                       },
//                       icon: const Icon(
//                         Icons.refresh,
//                         color: Colors.white,
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         loading: SizedBox(
//           width: 0.7.sw,
//           child: Align(
//             alignment: AlignmentDirectional.topEnd,
//             child: Stack(
//               alignment: AlignmentDirectional.topEnd,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       color: AppColors.primary,
//                       border: Border.all(color: Colors.transparent),
//                       borderRadius: const BorderRadius.only(
//                         bottomRight: Radius.circular(16),
//                         bottomLeft: Radius.circular(16),
//                         topLeft: Radius.circular(16),
//                         topRight: Radius.circular(0),
//                       )),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 16.0, horizontal: 16),
//                     child: AssetsPhotoChatWidget(
//                       mediaList: widget.messageModel.mediaList ?? [],
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Container(
//                     color: Colors.white38,
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 4.0,
//                       ),
//                       child: CupertinoActivityIndicator(
//                         color: Colors.black,
//                         radius: 35,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         onCubitCreated: (cubit) {
//           _getModelCubit = cubit;
//         },
//         onSuccess: (LastMessageModel model) async {
//           index = context
//               .read<ChatCubit>()
//               .msgList
//               .indexWhere((element) => (element.idLocal == widget.idLocal));
//           context.read<ChatCubit>().msgList[index!] = model;
//           context.read<ChatCubit>().widgetList[index!] = MessageCardWidget(
//               key: const ValueKey('2'),
//               messageModel: context.read<ChatCubit>().msgList[index!],
//               fromReciever: false,
//               whenDone: () {
//                 widget.whenDone();
//               });
//           isLoading = false;
//           setState(() {});
//           widget.whenDone();
//         },
//         useCaseCallBack: () {
//           return SendMessageUseCase(ChatRepository()).call(
//               params: ChatParams(
//                   senderId: CacheHelper.userID ?? 0,
//                   recieverId:
//                       (CacheHelper.userID ?? '') != widget.messageModel.sender
//                           ? widget.messageModel.sender!
//                           : widget.messageModel.receiver!,
//                   msg: widget.messageModel.message ?? '',
//                   photos: imagesList,
//                   videos: videosList));
//         },
//         modelBuilder: (model) {
//           return MessageCardWidget(
//             key: const ValueKey('2'),
//             whenDone: () {
//               widget.whenDone();
//             },
//             messageModel: context.read<ChatCubit>().msgList[index!],
//             fromReciever: false,
//           );
//         });
//   }
// }
