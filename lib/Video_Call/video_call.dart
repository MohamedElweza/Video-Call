// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as rtc_local_view;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtc_remote_view;
//
// class VideoCallScreen extends StatefulWidget {
//   final String channelName;
//   final ClientRole role;
//
//   VideoCallScreen({required this.channelName, required this.role});
//
//   @override
//   _VideoCallScreenState createState() => _VideoCallScreenState();
// }
//
// class _VideoCallScreenState extends State<VideoCallScreen> {
//   late RtcEngine _engine;
//
//   @override
//   void initState() {
//     super.initState();
//     initializeAgora();
//   }
//
//   Future<void> initializeAgora() async {
//     _engine = await RtcEngine.createWithConfig(RtcEngineConfig('3b4912edb0b541c6a205d2fd744e7c73'));
//     await _engine.enableVideo();
//     await _engine.joinChannel(null, widget.channelName, null, 0);
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.destroy();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Video Call')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Local video preview
//             rtc_local_view.SurfaceView(),
//             SizedBox(height: 20),
//             // Remote video view (Assuming single participant)
//           ],
//         ),
//       ),
//     );
//   }
// }
