// import 'package:app_main/src/core/coordinator/app_coordinator.dart';
// import 'package:app_main/src/presentation/call/1vs1/bloc/call_1vs1_bloc.dart';
// import 'package:app_main/src/presentation/call/1vs1/views/call_1vs1_screen.dart';
// import 'package:app_main/src/presentation/call/models/call_1vs1_state_data.dart';
// import 'package:app_main/src/presentation/live/presentation/pip/pip_handler.dart';
// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:imagewidget/imagewidget.dart';
// import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';
// import 'package:app_core/app_core.dart';
//
// class PipCallRender extends StatelessWidget {
//   const PipCallRender({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.black,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           const _CallRender(),
//           Align(
//             alignment: Alignment.center,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   AppCoordinator.rootNavigator.currentContext!,
//                   MaterialPageRoute(
//                     builder: (_) => BlocProvider<Call1vs1Bloc>.value(
//                       value: context.read(),
//                       child: const Call1vs1Screen(
//                         fromPip: true,
//                         callType: CallType.video,
//                       ),
//                     ),
//                   ),
//                 );
//                 PipHandler.removeOverlay();
//               },
//               behavior: HitTestBehavior.opaque,
//               child: SizedBox.square(
//                 dimension: 40,
//                 child: Center(
//                   child: ImageWidget(IconAppConstants.icExpandCall),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _CallRender extends StatelessWidget {
//   const _CallRender();
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaData = MediaQuery.of(context);
//     Call1vs1Bloc bloc = context.read();
//
//     return Hero(
//       tag: 'render owner',
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(1),
//         child: Stack(
//           children: [
//             SizedBox.fromSize(
//               size: mediaData.size,
//               child: Builder(
//                 builder: (context) {
//                   if (bloc.state.callState.hasLocalTrack &&
//                       bloc.state.callType == CallType.video &&
//                       bloc.state.isMakingACall) {
//                     StringeeVideoView(
//                       bloc.state.callId,
//                       true,
//                       alignment: Alignment.topRight,
//                       borderRadius: BorderRadius.circular(12),
//                       margin: const EdgeInsets.only(top: 128, right: 16),
//                       height: 195,
//                       width: 136,
//                       scalingType: ScalingType.fill,
//                     );
//                   }
//                   if (bloc.state.callState.hasPaticipantTrack &&
//                       bloc.state.callId.isNotNullOrEmpty &&
//                       bloc.state.callType == CallType.video) {
//                     return StringeeVideoView(
//                       bloc.state.callId,
//                       false,
//                       isMirror: false,
//                       alignment: Alignment.center,
//                       height: mediaData.size.height,
//                       width: mediaData.size.width,
//                       scalingType: ScalingType.fill,
//                     );
//                   }
//                   return const SizedBox();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
