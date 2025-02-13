// import 'dart:io';
// import 'package:cached_chewie_plus/cached_chewie_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:rent_chicken/features/chat/cubit/chat_states.dart';
// import 'package:rent_chicken/features/chat/data/model/conversation_model.dart';
// import 'package:rent_chicken/features/chat/data/model/last_message_model.dart';
// import 'package:rent_chicken/features/chat/data/model/assets_media_list_model.dart';
// import '../../../core/socket/public_socket/socket_logic.dart';
// import 'package:file_picker/file_picker.dart';
//
//
// class ChatCubit extends Cubit<ChatStates> {
//   ChatCubit() : super(ChatInitialState());
//   bool isLoading=false;
//   ChatSocket? chatSocket;
//   int? conversationId;
//   int? supportConversationId;
//   ChewieController? chewieController;
//   List<LastMessageModel> msgList = [];
//   List<Widget> widgetList=[];
//   List<Widget> allConversationWidgetList=[];
//   List<ConversationModel> allConversationList=[];
//   List<AssetsMediaListModel> mediaList=[];
//   LastMessageModel? networkPreviewMediaMessage;
//   bool isShowPreview=false;
//   bool isLoadingAssets=false;
//   VoidCallback? whenDone;
//
//   Future<void> selectImage({required ImageSource imageSource,required Function whenDone}) async {
//     final imagePicker = ImagePicker();
//     if(imageSource==ImageSource.camera){
//     var pickedFile= await imagePicker.pickImage(source: imageSource , imageQuality: 25,);
//      if (pickedFile != null ) {
//        mediaList.add(AssetsMediaListModel(isPhoto: true, file: File(pickedFile.path)));
//       whenDone();
//     } else {}}
//     else{
//       var pickedFile= await imagePicker.pickMultiImage( imageQuality: 25,);
//       pickedFile.forEach((element) {
//         mediaList.add(AssetsMediaListModel(isPhoto: true, file: File(element.path)));
//       });
//         whenDone();
//     }
//   }
//
//   Future<void> selectVideo({ required VoidCallback whenDone}) async {
//
//     final FilePickerResult? videoPicker=  await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.video,);
//
//     videoPicker?.files.forEach((element) {
//       mediaList.add(AssetsMediaListModel(isPhoto: false, file: File(element.path??'')));
//     });
//       whenDone();
//   }
//
//   clear(){
//     msgList = [];
//     mediaList = [];
//     widgetList=[];
//     allConversationWidgetList=[];
//     allConversationList=[];
//     networkPreviewMediaMessage=null;
//     supportConversationId=null;
//     isShowPreview=false;
//   }
//
//   chatScreenClear(){
//     msgList = [];
//     mediaList = [];
//     widgetList=[];
//     networkPreviewMediaMessage=null;
//     isShowPreview=false;
//     supportConversationId=null;
//   }
//
// }
