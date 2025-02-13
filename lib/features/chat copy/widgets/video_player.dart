// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:cached_chewie_plus/cached_chewie_plus.dart';
//
// class VideoPlayerScreen extends StatefulWidget {
//   final String url;
//   final File? videoFile;
//   final bool fromChat;
//   final bool fromAssets;
//
//   VideoPlayerScreen({required this.url, this.fromChat=false,  this.fromAssets=false, this.videoFile});
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   bool playerYoutube = false;
//   CachedVideoPlayerController? videoController;
//   ChewieController? chewieController;
//
//
//   void initializePlayer(String url) {
//
//     if(!widget.fromAssets){
//       videoController = CachedVideoPlayerController.networkUrl(
//         Uri.parse(widget.url),
//         videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true,),
//       )..initialize().then((_) async {
//         if(!widget.fromChat)  await videoController!.play();
//         chewieController = ChewieController(
//           videoPlayerController: videoController!,
//           autoPlay: widget.fromChat?false: true,
//           looping: true,
//           aspectRatio:widget.fromChat? 0.9: null,
//           showControls:widget.fromChat?false: true,
//         );
//         setState(() {
//         });
//       });
//     }
//     else{
//       videoController = CachedVideoPlayerController.file(
//         widget.videoFile!,
//         videoPlayerOptions: VideoPlayerOptions(),
//       )..initialize().then((_) async {
//         if(!widget.fromChat)  await videoController!.play();
//         chewieController = ChewieController(
//           videoPlayerController: videoController!,
//           autoPlay: widget.fromChat?false: true,
//           looping: true,
//           showControls:widget.fromChat?false: true,
//         );
//         setState(() {
//         });
//       });
//     }
//   }
//
//   Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//     if(videoController!=null){
//     switch (state) {
//       case AppLifecycleState.inactive:
//         videoController!.pause();
//         break;
//       case AppLifecycleState.resumed:
//         videoController!.pause();
//         break;
//       case AppLifecycleState.paused:
//         videoController!.pause();
//         break;
//       case AppLifecycleState.detached:
//         videoController!.dispose();
//         break;
//     }
//   }}
//
//   @override
//   void initState() {
//     initializePlayer(widget.url);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       SizedBox(
//         height:widget.fromChat?150:null,
//         width:widget.fromChat? 90 : null,
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             chewieController!=null?
//             Chewie( controller: chewieController!,) : CircularProgressIndicator(),
//             if(widget.fromChat)
//               Container(
//                 // height: 150,
//                 // width: 90,
//               //  color: Colors.black.withOpacity(0.2),
//                 child: Icon(Icons.play_circle_fill_rounded,
//                   color: Colors.white60,
//                 ),
//               )
//           ],
//         ),
//       );
//   }
// }
