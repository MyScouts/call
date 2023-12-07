import 'package:flutter/material.dart';

class ReelsTab extends StatefulWidget {
  const ReelsTab({super.key});

  @override
  State<ReelsTab> createState() => _ReelsTabState();
}

class _ReelsTabState extends State<ReelsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('Reels Tab'));
  }

  @override
  bool get wantKeepAlive => true;
}
