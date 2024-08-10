import 'package:flutter/material.dart';

class ScrollWheelIntPicker extends StatelessWidget {
  final int? initValue;
  final int maxValue;
  final ValueChanged<int> onSelected;
  const ScrollWheelIntPicker({
    Key? key,
    this.initValue,
    this.maxValue = 130,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black38,
            Colors.black,
            Colors.black,
            Colors.black38,
            Colors.transparent,
          ],
        ).createShader(bounds),
        blendMode: BlendMode.dstIn,
        child: RotatedBox(
          quarterTurns: -1,
          child: ListWheelScrollView(
            itemExtent: 30,
            offAxisFraction: 1,
            perspective: 0.005,
            diameterRatio: 1.2,
            physics: const FixedExtentScrollPhysics(),
            controller: FixedExtentScrollController(
                initialItem: initValue?.toInt() ?? 0),
            onSelectedItemChanged: (value) => onSelected(value),
            children: List.generate(
              maxValue,
              (index) => RotatedBox(
                quarterTurns: 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: index == initValue ? 70 : 60,
                  height: index == initValue ? 70 : 60,
                  decoration: BoxDecoration(
                      color: index == initValue ? Colors.red : Colors.white,
                      shape: BoxShape.circle),
                  child: Center(
                      child: Text(
                    "$index",
                    style: TextStyle(
                        color: index == initValue ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
