// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../utils/insets.dart';

class ProfileLabel extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget icon;
  final bool isDivider;
  const ProfileLabel({
    Key? key,
    required this.title,
    required this.body,
    required this.icon,
    this.isDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        // Padding(
        //     padding: const EdgeInsets.only(top: 20),
        //     child: ClipOval(
        //       child: Container(
        //         color: Colors.white,
        //         width: 200,
        //         height: 100,
        //       ),
        //     )),
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(
              top: 50, left: Insets.s, right: Insets.s, bottom: Insets.s),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(-4, 4),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: <Widget>[
              Center(child: title),
              isDivider
                  ? const Divider(color: Colors.transparent)
                  : const SizedBox(),
              body,
            ],
          ),
        ),
        Positioned(
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: icon,
            ),
          ),
        ),
      ],
    );
  }
}
