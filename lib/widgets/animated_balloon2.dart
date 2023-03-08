import 'package:flutter/material.dart';

class AnimatedBalloon2Widget extends StatefulWidget {
  const AnimatedBalloon2Widget({super.key});

  @override
  State<AnimatedBalloon2Widget> createState() => _AnimatedBalloon2WidgetState();
}

class _AnimatedBalloon2WidgetState extends State<AnimatedBalloon2Widget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _balloonHeight = MediaQuery.of(context).size.height / 2;
    double _balloonWidth = MediaQuery.of(context).size.height / 3;
    double _balloonBottomLocation =
        MediaQuery.of(context).size.height - _balloonHeight;

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.bounceInOut),
      ),
    );
    _animationGrowSize = Tween(begin: 40.0, end: _balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInCubic),
      ),
    );
    return AnimatedBuilder(
        animation: _animationFloatUp,
        builder: (context, child) {
          return Container(
            margin: EdgeInsets.only(
              top: _animationFloatUp.value,
            ),
            width: _animationGrowSize.value,
            child: child,
          );
        },
        child: GestureDetector(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: Image.asset('assets/images/BeginningGoogleFlutter‐Balloon.jpg',
              height: _balloonHeight, width: _balloonWidth),
        ));
  }
}
