// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../utils/insets.dart';

class AddProdDropdown extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  const AddProdDropdown({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AddProdDropdown> createState() => _AddProdDropdownState();
}

class _AddProdDropdownState extends State<AddProdDropdown> {
  String? _unitValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.all(Insets.xs),
      child: DropdownButton(
        style: const TextStyle(color: Colors.white, fontSize: 16),
        dropdownColor: Colors.red.withOpacity(0.9),
        value: _unitValue,
        isExpanded: true,
        hint: const Text(
          "Unit",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        items: const [
          DropdownMenuItem(
            value: "grams",
            child: Text("Grams"),
          ),
          DropdownMenuItem(
            value: "ml",
            child: Text("Milliliters"),
          ),
        ],
        onChanged: (value) => setState(() {
          _unitValue = value;
          widget.onChanged(value);
        }),
      ),
    );
  }
}
