import 'package:flutter/services.dart';

class IntegerTextInputFormatter extends TextInputFormatter {
  IntegerTextInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value = newValue.text;
    if (int.tryParse(value) != null) {
      truncated = newValue.text;
      newSelection = newValue.selection;

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return oldValue;
  }
}
