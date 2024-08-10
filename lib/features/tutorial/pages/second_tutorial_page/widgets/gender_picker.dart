import 'package:auto_size_text/auto_size_text.dart';
import '/utils/insets.dart';
import 'package:flutter/material.dart';

import '../../../utils/tutorial_elevated_button_decoration.dart';

class GenderPicker extends StatelessWidget {
  final bool? gender;
  final ValueChanged<bool> onChanged;
  final bool isLadscapeView;
  const GenderPicker({
    Key? key,
    this.gender,
    required this.onChanged,
    this.isLadscapeView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isLadscapeView
          ? Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: _genderButton(
                    true,
                    "Male",
                    const Icon(
                      Icons.male,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: Insets.s),
                SizedBox(
                  width: double.infinity,
                  child: _genderButton(
                    false,
                    "Female",
                    const Icon(
                      Icons.female,
                      size: 40,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _genderButton(
                    true,
                    "Male",
                    const Icon(
                      Icons.male,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(width: Insets.s),
                Expanded(
                  child: _genderButton(
                    false,
                    "Female",
                    const Icon(
                      Icons.female,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _genderButton(bool isMale, String label, Icon icon) => Opacity(
        opacity: gender == isMale || gender == null ? 1.0 : 0.5,
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () => onChanged(isMale),
            style: tutorialElevatedButtonDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  AutoSizeText(label),
                ],
              ),
            ),
          ),
        ),
      );
}
