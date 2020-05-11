library flutter_otp_timer;

import 'package:flutter/material.dart';
import 'package:flutter_otp_timer/time_painter.dart';

class OtpTimer extends StatefulWidget {
  final double radius;
  final int duration;
  final double timeTextSize;
  final Color backgroundColor;
  final Color animatingColor;

  OtpTimer({
    @required this.radius,
    @required this.duration,
    @required this.timeTextSize,
    this.backgroundColor,
    this.animatingColor,
  });

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// initiates animation on build
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Center(
          child: Stack(
            children: <Widget>[
              Container(
                height: widget.radius,
                width: widget.radius,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: TimePainter(
                                      animation: controller,
                                      backgroundColor: widget.backgroundColor,
                                      color: widget.animatingColor,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: widget.timeTextSize,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
