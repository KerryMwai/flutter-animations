
import 'package:flutter/material.dart';

class AnimatedBallonWidget extends StatefulWidget {
  const AnimatedBallonWidget({super.key});

  @override
  State<AnimatedBallonWidget> createState() => _AnimatedBallonWidgetState();
}

class _AnimatedBallonWidgetState extends State<AnimatedBallonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;

  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;
  @override
  void initState(){
    super.initState();
      _animationFloatUp =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    _animationGrowSize =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _ballonHeight = MediaQuery.of(context).size.height / 2;
    double _ballonWidht = MediaQuery.of(context).size.height / 3;
    double _ballonBottomLocation =
        MediaQuery.of(context).size.height - _ballonHeight;

    _animationFloatUp = Tween(begin: _ballonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _controllerFloatUp, curve: Curves.fastOutSlowIn));

    _animationGrowSize = Tween(begin: 50.0, end: _ballonWidht).animate(
        CurvedAnimation(
            parent: _controllerGrowSize, curve: Curves.elasticInOut));
    _controllerFloatUp.forward();
    _controllerGrowSize.forward();
    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(top: _animationFloatUp.value),
          width: _animationGrowSize.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
          }
        },
        child: Image.asset(
          "assets/images/BeginningGoogleFlutter‐Balloon.jpg",
          width: _ballonWidht,
          height: _ballonHeight,
        ),
      ),
    );
  }
}
