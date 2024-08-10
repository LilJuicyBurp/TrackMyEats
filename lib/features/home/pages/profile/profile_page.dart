import '/bloc/user/user_bloc.dart';
import '/data/models/user_model.dart';
import '/features/home/pages/profile/widgets/avatar.dart';
import '/features/home/pages/profile/widgets/profile_default_title.dart';
import '/features/home/pages/profile/widgets/profile_gender_picker.dart';
import '/features/home/pages/profile/widgets/profile_label.dart';
import '/utils/insets.dart';
import '/utils/user_shared_preferences.dart';
import '/widgets/inputDecoration/border_cross.dart';
import '/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/buttons/activity_choice_button.dart';
import '../../../tutorial/pages/third_tutorial_page/utils/activity_items.dart';
import 'widgets/scroll_wheel_int_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel user = UserModel.fromSharedPreferences();

  final TextEditingController _loginController =
      TextEditingController(text: UserSharedPreferences.getUserLogin());

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.orange,
      floatingActionButton: _isChange()
          ? FloatingActionButton.extended(
              onPressed: () => BlocProvider.of<UserBloc>(context)
                  .add(UpdateUserData(user: user)),
              label: const Text("Save"),
              icon: BlocConsumer<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UpdatingUserData) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  }
                  return const Icon(Icons.save);
                },
                listener: (context, state) {
                  if (state is UserDataUpdated) {
                    setState(() {});
                  }
                },
              ),
            )
          : null,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Profile"),
            centerTitle: true,
            floating: true,
            leading: MenuWidget(),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: orientation == Orientation.portrait
                  ? _portraitView()
                  : _landscapeView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _portraitView() => Column(
        children: <Widget>[
          _loginField(),
          const SizedBox(height: Insets.m),
          _genderPicker(),
          const SizedBox(height: Insets.s),
          _agePicke(),
          const SizedBox(height: Insets.s),
          _weightPicke(),
          const SizedBox(height: Insets.s),
          _heightPicke(),
          const SizedBox(height: Insets.s),
          ProfileLabel(
            title: const ProfileDefaultTitle(title: "Activity"),
            body: _activityPicker(2),
            icon: const Icon(
              Icons.sports_basketball,
              size: 35,
            ),
          ),
          SizedBox(height: _isChange() ? 60 : 0),
        ],
      );

  Widget _landscapeView() => Column(
        children: <Widget>[
          _loginField(),
          const SizedBox(height: Insets.m),
          Row(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Column(
                  children: <Widget>[
                    _genderPicker(),
                    const SizedBox(height: Insets.s),
                    _agePicke(),
                    const SizedBox(height: Insets.s),
                    _weightPicke(),
                    const SizedBox(height: Insets.s),
                    _heightPicke(),
                    const SizedBox(height: Insets.s),
                  ],
                ),
              ),
              const SizedBox(width: Insets.s),
              Expanded(
                flex: 3,
                child: ProfileLabel(
                  title: const ProfileDefaultTitle(title: "Activity"),
                  body: _activityPicker(1),
                  icon: const Icon(
                    Icons.sports_basketball,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: _isChange() ? 60 : 0),
        ],
      );

  String _lottePath() {
    bool? gender = UserSharedPreferences.getUserGender();
    if (gender != null) {
      if (gender) {
        //male avatar
        return 'assets/lottie/male.json';
      }
      //female avatar
      return 'assets/lottie/female.json';
    }
    //unisex avatar
    return 'assets/lottie/person.json';
  }

  Widget _loginField() => Row(
        children: [
          Avatar(lottiePath: _lottePath()),
          Expanded(
            child: TextFormField(
              controller: _loginController,
              decoration: borderCross(
                "Your name (optional)",
                const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                3,
              ),
              onChanged: (value) => setState(() {
                user.login = value;
              }),
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      );

  Widget _genderPicker() => ProfileLabel(
        title: const ProfileDefaultTitle(title: "Gender"),
        isDivider: true,
        body: ProfileGenderPicker(
            gender: user.gender,
            onChange: (value) => setState(() {
                  user.gender = value;
                })),
        icon: const Icon(
          Icons.person,
          size: 35,
        ),
      );

  Widget _agePicke() => ProfileLabel(
        title: const ProfileDefaultTitle(title: "Age"),
        body: ScrollWheelIntPicker(
          initValue: user.age?.toInt(),
          onSelected: (value) => setState(() {
            user.age = value;
          }),
        ),
        icon: const Icon(
          Icons.calendar_month,
          size: 35,
        ),
      );

  Widget _heightPicke() => ProfileLabel(
        title: const ProfileDefaultTitle(title: "Height"),
        body: ScrollWheelIntPicker(
          initValue: user.height?.toInt(),
          maxValue: 260,
          onSelected: (value) => setState(() {
            user.height = value;
          }),
        ),
        icon: const Icon(
          Icons.height,
          size: 35,
        ),
      );

  Widget _weightPicke() => ProfileLabel(
        title: const ProfileDefaultTitle(title: "Weight"),
        body: ScrollWheelIntPicker(
          initValue: user.weight?.toInt(),
          maxValue: 250,
          onSelected: (value) => setState(() {
            user.weight = value;
          }),
        ),
        icon: const Icon(
          Icons.monitor_weight,
          size: 35,
        ),
      );

  Widget _activityPicker(int crossAxisCount) => GridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: Insets.xs,
        crossAxisSpacing: Insets.xs,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          ...ActivityItems.activities.map(
            (activity) => Opacity(
              opacity: user.pal?.toDouble() == activity.value ? 1.0 : 0.5,
              child: ActivityChoiceButton(
                activity: activity,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                onPicked: (item) => setState(
                  () {
                    user.pal = item.value;
                  },
                ),
              ),
            ),
          ),
        ],
      );

  bool _isChange() =>
      user.login != UserSharedPreferences.getUserLogin() ||
      user.gender != UserSharedPreferences.getUserGender() ||
      user.age?.toInt() != UserSharedPreferences.getUserAge() ||
      user.height?.toDouble() != UserSharedPreferences.getUserHeight() ||
      user.weight?.toDouble() != UserSharedPreferences.getUserWeight() ||
      user.pal?.toDouble() != UserSharedPreferences.getUserPAL();
}
