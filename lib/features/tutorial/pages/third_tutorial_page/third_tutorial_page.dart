// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import '/features/tutorial/pages/third_tutorial_page/utils/activity_items.dart';
import '/utils/user_shared_preferences.dart';
import 'package:flutter/material.dart';

import '/data/models/activity_item.dart';
import '/utils/insets.dart';

import '../../../../widgets/boxDecoration/home_gradnient_bacground.dart';
import '../../../../widgets/buttons/activity_choice_button.dart';

// ignore: must_be_immutable
class ThirdTutorialPage extends StatefulWidget {
  ActivityItem? currentItem;
  ThirdTutorialPage({
    Key? key,
    this.currentItem,
  }) : super(key: key);

  @override
  State<ThirdTutorialPage> createState() => _ThirdTutorialPageState();
}

class _ThirdTutorialPageState extends State<ThirdTutorialPage> {
  @override
  void initState() {
    try {
      final item = ActivityItems.activities.firstWhere(
          (activity) => activity.value == UserSharedPreferences.getUserPAL());
      widget.currentItem = item;
      // ignore: empty_catches
    } catch (e) {}
    super.initState();
  }

  @override
  Future<void> dispose() async {
    super.dispose();

    if (widget.currentItem != null) {
      await UserSharedPreferences.setUserPAL(widget.currentItem!.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: homeGradientBacground(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Insets.s),
            child: Column(
              children: [
                const Spacer(),
                _activityTitle(),
                const Spacer(),
                const SizedBox(height: Insets.s),
                Expanded(
                  flex: 10,
                  child: _activityPicker(
                      orientation == Orientation.portrait ? 2 : 4),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _activityTitle() => const AutoSizeText(
        "How active are you?",
        maxLines: 1,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      );

  Widget _activityPicker(int crossAxisCount) => GridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: Insets.xs,
        crossAxisSpacing: Insets.xs,
        children: [
          ...ActivityItems.activities.map((activity) => Opacity(
                opacity:
                    widget.currentItem == activity || widget.currentItem == null
                        ? 1.0
                        : 0.7,
                child: ActivityChoiceButton(
                    activity: activity,
                    onPicked: (item) => setState(() {
                          widget.currentItem = item;
                        })),
              )),
        ],
      );
}
