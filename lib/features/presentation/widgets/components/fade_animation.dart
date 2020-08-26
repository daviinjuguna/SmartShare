import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //     Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //     curve: Curves.easeOut)
    // ]);

    final _tween = MultiTween<AnimProps>()
    ..add(AnimProps.opacity, 0.0.tweenTo(1.0),500.milliseconds)
    ..add(AnimProps.translatY, Tween(begin: -30.0, end: 0.0),500.milliseconds,Curves.easeOut);


    return CustomAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AnimProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AnimProps.translatY)), 
          child: child
        ),
      ),
    );
  }
}

enum AnimProps{opacity, translatY}