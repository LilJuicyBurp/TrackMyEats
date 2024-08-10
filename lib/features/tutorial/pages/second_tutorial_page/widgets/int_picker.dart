// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import '/features/tutorial/utils/tutorial_elements_shape.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/insets.dart';

// ignore: must_be_immutable
class IntPicker extends StatelessWidget {
  int value;
  final String label;
  final ValueChanged<int> onChanged;
  bool isUnit;
  String unit;
  IntPicker({
    Key? key,
    this.value = 0,
    required this.label,
    required this.onChanged,
    this.isUnit = false,
    this.unit = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: tutorialElementsRadius(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.xs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              label,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: Insets.xs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => onChanged(++value),
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_drop_up_sharp),
                    ),
                  ),
                  AutoSizeText(
                    "$value",
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  //Flexible(flex: 3, child: _numberField()),
                  InkWell(
                    onTap: () {
                      if (value > 0) {
                        onChanged(--value);
                      }
                    },
                    child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.arrow_drop_down_sharp),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
