import 'package:auto_size_text/auto_size_text.dart';
import '/features/tutorial/pages/second_tutorial_page/widgets/gender_picker.dart';
import '/features/tutorial/pages/second_tutorial_page/widgets/height_picekr.dart';
import '/features/tutorial/pages/second_tutorial_page/widgets/int_picker.dart';
import '/utils/insets.dart';
import '/utils/user_shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/boxDecoration/home_gradnient_bacground.dart';

class SecondTuorialPage extends StatefulWidget {
  const SecondTuorialPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondTuorialPage> createState() => _SecondTuorialPageState();
}

class _SecondTuorialPageState extends State<SecondTuorialPage> {
  bool? _gender;
  int _height = 0;
  int _wheight = 0;
  int _age = 0;

  @override
  void initState() {
    _gender = UserSharedPreferences.getUserGender();
    _height = UserSharedPreferences.getUserHeight()?.toInt() ?? 0;
    _height = UserSharedPreferences.getUserWeight()?.toInt() ?? 0;
    _age = UserSharedPreferences.getUserAge() ?? 0;
    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    if (_gender != null) {
      await UserSharedPreferences.setUserGender(_gender ?? true);
    }
    await UserSharedPreferences.setUserHeight(_height.toDouble());
    await UserSharedPreferences.setUserWeight(_wheight.toDouble());
    await UserSharedPreferences.setUserAge(_age);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: homeGradientBacground(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Insets.s),
            child: orientation == Orientation.portrait
                ? _portraitView(width, height)
                : _landscapeView(width, height),
          ),
        ),
      ),
    );
  }

  Widget _portraitView(double width, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _helpTitle(width),
        SizedBox(height: height / 17),
        GenderPicker(
          gender: _gender,
          onChanged: (value) => setState(
            () => _gender = value,
          ),
        ),
        SizedBox(height: height / 17),
        HeightPicker(
          height: _height,
          onChanged: (value) => setState(
            () => _height = value.ceil(),
          ),
        ),
        SizedBox(height: height / 17),
        Row(
          children: [
            Expanded(
              child: IntPicker(
                label: "Wheight",
                unit: "kg",
                isUnit: true,
                value: _wheight,
                onChanged: (value) => setState(
                  () => _wheight = value,
                ),
              ),
            ),
            const SizedBox(width: Insets.s),
            Expanded(
              child: IntPicker(
                label: "Age",
                value: _age,
                onChanged: (value) => setState(() {
                  _age = value;
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _landscapeView(double width, double height) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _helpTitle(width),
            const SizedBox(height: Insets.s),
            Row(
              children: [
                Expanded(
                  child: GenderPicker(
                    isLadscapeView: true,
                    gender: _gender,
                    onChanged: (value) => setState(
                      () => _gender = value,
                    ),
                  ),
                ),
                const SizedBox(width: Insets.s),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      HeightPicker(
                        height: _height,
                        onChanged: (value) => setState(
                          () => _height = value.ceil(),
                        ),
                      ),
                      const SizedBox(height: Insets.xs),
                      Row(
                        children: [
                          Expanded(
                            child: IntPicker(
                              label: "Wheight",
                              unit: "kg",
                              isUnit: true,
                              value: _wheight,
                              onChanged: (value) => setState(
                                () => _wheight = value,
                              ),
                            ),
                          ),
                          const SizedBox(width: Insets.s),
                          Expanded(
                            child: IntPicker(
                              label: "Age",
                              value: _age,
                              onChanged: (value) => setState(() {
                                _age = value;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _helpTitle(double width) => const AutoSizeText(
        "Help us to calculate your daily caloric needs!",
        maxLines: 2,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      );
}
