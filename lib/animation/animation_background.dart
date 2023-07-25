import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// class AnimatedBackground extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTween<AnimProps>()
//       ..add(AnimProps.color1, ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900))
//       ..add(AnimProps.color2, ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600));

//     return ControlledAnimation(
//       playback: Playback.MIRROR,
//       tween: tween,
//       duration: Duration(seconds: 3),
//       builder: (context, animation) {
//         return Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [animation[AnimProps.color1], animation[AnimProps.color2]],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// enum AnimProps { color1, color2 }
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _color1Animation;
  late Animation<Color?> _color2Animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    final color1Tween =
        ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900);
    final color2Tween =
        ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600);

    _color1Animation = color1Tween.animate(_animationController);
    _color2Animation = color2Tween.animate(_animationController);

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _color1Animation.value ?? Colors.transparent,
                _color2Animation.value ?? Colors.transparent
              ],
            ),
          ),
        );
      },
    );
  }
}
