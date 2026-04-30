// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:video_player/video_player.dart';
// import 'VideoFull.dart';
//
// class VideoItem extends StatefulWidget {
//
//   VideoItem(this.url);
//   final String url;
//
//   @override
//   _VideoItemState createState() => _VideoItemState();
// }
//
// class _VideoItemState extends State<VideoItem> {
//
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               height: 90,
//               width: MediaQuery.of(context).size.width / 2 - 24,
//               margin: EdgeInsets.only(
//                   top: MediaQueryData.fromWindow(
//                       WidgetsBinding.instance!.window)
//                       .padding
//                       .top),
//               color: Colors.black,
//               child: _controller.value.isInitialized
//                   ? Hero(
//                 tag: "player",
//                 child: AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 ),
//               )
//                   : Container(
//                 alignment: Alignment.center,
//                 child: CircularProgressIndicator(),
//               ),
//             )),
//         Positioned(
//             top: 40,
//             left: MediaQuery.of(context).size.width / 4 - 64,
//             child: TextButton(
//                 onPressed: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) {
//                     return VideoFullPage(_controller);
//                   }));
//                   setState(() {
//                     _controller.play();
//                   });
//                 },
//                 child: SvgPicture.asset('assets/images/svg/play-icon.svg', width: 60, height: 60, color: Colors.black54),
//             )
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
