import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Avatar extends StatelessWidget {
  final String lottiePath;
  const Avatar({
    Key? key,
    required this.lottiePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ..._shadows,
        ..._background,
        const CircleAvatar(
          radius: 45,
          backgroundColor: Colors.red,
        ),
        LottieBuilder.asset(
          height: 100,
          lottiePath,
        ),
      ],
    );
  }
}

const List<Widget> _shadows = [
  Positioned(
    top: 9,
    left: 4,
    child: CircleAvatar(
      backgroundColor: Color.fromARGB(100, 158, 158, 158),
      radius: 20,
    ),
  ),
  Positioned(
    bottom: 9,
    left: 0,
    child: CircleAvatar(
      backgroundColor: Color.fromARGB(100, 158, 158, 158),
      radius: 7,
    ),
  ),
  Positioned(
    left: 13,
    top: 2,
    child: CircleAvatar(
      radius: 50,
      backgroundColor: Color.fromARGB(100, 158, 158, 158),
    ),
  ),
  Positioned(
    right: 17,
    top: 5,
    child: CircleAvatar(
      radius: 10,
      backgroundColor: Color.fromARGB(100, 158, 158, 158),
    ),
  ),
];

const List<Widget> _background = [
  Positioned(
    right: 13,
    top: 2,
    child: CircleAvatar(
      radius: 10,
      backgroundColor: Colors.white,
    ),
  ),
  Positioned(
    bottom: 11,
    left: 4,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 7,
    ),
  ),
  Positioned(
    top: 8,
    left: 8,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
    ),
  ),
  CircleAvatar(
    radius: 50,
    backgroundColor: Colors.white,
  ),
];
