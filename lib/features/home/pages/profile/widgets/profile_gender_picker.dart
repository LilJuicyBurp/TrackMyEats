// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../utils/insets.dart';

class ProfileGenderPicker extends StatelessWidget {
  final bool? gender;
  final ValueChanged<bool> onChange;
  const ProfileGenderPicker({
    Key? key,
    this.gender,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.xs),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(5),
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        child: Container(
          color: Colors.red.withOpacity(0.5),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () => onChange(true),
                  child: Container(
                    color: gender == true ? Colors.red : null,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 51,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gender == true
                          ? [
                              Colors.red,
                              Colors.red.withOpacity(0),
                            ]
                          : gender == false
                              ? [
                                  Colors.red.withOpacity(0),
                                  Colors.red,
                                ]
                              : [
                                  Colors.red.withOpacity(0),
                                  Colors.red.withOpacity(0),
                                ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () => onChange(false),
                  child: Container(
                    color: gender == false ? Colors.red : null,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.female,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
