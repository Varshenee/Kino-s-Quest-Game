import 'dart:async';
import 'package:flutter/material.dart';

class KinoWalking extends StatefulWidget {
  final double size;
  const KinoWalking({this.size = 100, Key? key}) : super(key: key);

  @override
  State<KinoWalking> createState() => _KinoWalkingState();
}

class _KinoWalkingState extends State<KinoWalking> {
  int _frame = 0;
  late Timer _timer;
  final int totalFrames = 4;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 150), (timer) {
      setState(() {
        _frame = (_frame + 1) % totalFrames;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/kino/walk_${_frame + 1}.png',
      width: widget.size,
      height: widget.size,
    );
  }
}
