import 'package:auto_size_text/auto_size_text.dart';
import '/data/models/food_label_model.dart';
import '/features/home/pages/main/widgets/bar_chart/bar_chart.dart';
import '/features/home/pages/main/widgets/bmi_chart/bmi_chart.dart';
import '/features/home/pages/main/widgets/labelled_data.dart';
import '/utils/calorie_calculator.dart';
import '/utils/user_shared_preferences.dart';
import '/widgets/boxDecoration/shadow_radius_all.dart';
import '/widgets/menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/insets.dart';

List<double> data = [2230, 1968, 1000, 2777, 2000, 2150, 2333];
List<String> days = ["M", "T", "W", "T", "F", "S", "S"];

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final userPPM = CalorieCalculator.calculatePPM();
    return Scaffold(
      backgroundColor: Colors.orange,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go("/home/scaner"),
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text("Scan product"),
      ),
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text("Main"),
                centerTitle: true,
                leading: MenuWidget(),
                backgroundColor: Colors.orange,
                shadowColor: Colors.transparent,
                floating: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 75,
                      left: Insets.s,
                      right: Insets.s,
                      top: Insets.s),
                  child: orientation == Orientation.portrait
                      ? _portraitView(userPPM, context)
                      : _landscapeView(userPPM, context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _landscapeView(double? userPPM, BuildContext context) => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: _chart(context)),
              const SizedBox(width: Insets.s),
              Expanded(
                child: SizedBox(
                  height: 350,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _ppm(userPPM, 160),
                      _cpm(userPPM, 160),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Insets.s),
          _bmi(),
        ],
      );

  Widget _portraitView(double? userPPM, BuildContext context) => Column(
        children: <Widget>[
          _chart(context),
          const SizedBox(height: Insets.s),
          _ppm(userPPM),
          const SizedBox(height: Insets.s),
          _cpm(userPPM),
          const SizedBox(height: Insets.s),
          _bmi(),
        ],
      );

  Widget _chart(BuildContext context) => BarChart(
        data: UserSharedPreferences.getStats() != null
            ? UserSharedPreferences.getStats()!
                .map((stat) => FoodLabel.fromJson(stat).energy.toDouble())
                .toList()
                .reversed
                .toList()
            : [0, 0, 0, 0, 0, 0, 0],
        //labels: days,
        enableLabels: false,
        height: 350,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xs),
          child: AutoSizeText(
            "Daily Calories",
            maxLines: 1,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 1),
          child: AutoSizeText(
            "Your calories in this week",
            maxLines: 1,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        footer: _chartFotter(context),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(50, 116, 0, 0),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(3, 3)),
          ],
        ),
      );

  Widget _chartFotter(BuildContext context) => Column(
        children: <Widget>[
          // const Divider(
          //   color: Color.fromARGB(100, 244, 67, 54),
          //   indent: Insets.s,
          //   endIndent: Insets.s,
          //   thickness: 0.7,
          // ),
          Padding(
            padding: const EdgeInsets.only(
                left: Insets.xs, right: Insets.xs, top: Insets.xs),
            child: ElevatedButton(
              onPressed: () => context.go("/home/weekly_details"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("See more"),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _ppm(double? userPPM, [double? height]) => SizedBox(
        width: double.infinity,
        child: LabelledData(
          label: "Basal metabolic rate",
          height: height,
          data: AutoSizeText(
            userPPM != null
                ? "${userPPM.ceil().toString()} kcal"
                : "uzupełnij dane",
            maxLines: 1,
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 22),
          ),
          decoration: shadowRadiusAll(10),
        ),
      );

  Widget _cpm(double? userPPM, [double? height]) {
    final userCPM = CalorieCalculator.calculateCPM(userPPM);
    return SizedBox(
      width: double.infinity,
      child: LabelledData(
        label: "Total Metabolic Rate",
        height: height,
        data: AutoSizeText(
          userCPM != null
              ? "${userCPM.ceil().toString()} kcal"
              : "uzupełnij dane",
          maxLines: 1,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        decoration: shadowRadiusAll(10),
      ),
    );
  }

  Widget _bmi() {
    final userBMI = CalorieCalculator.calculateBMI();
    return SizedBox(
      width: double.infinity,
      child: LabelledData(
        label: "Body mass index",
        data: userBMI != null
            ? Column(
                children: [
                  AutoSizeText(
                    "Your BMI: ${userBMI.toStringAsFixed(2)}",
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                  const SizedBox(height: Insets.s),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Insets.xs),
                    child: BMIChart(
                      bmi: CalorieCalculator.calculateBMI(),
                      height: 50,
                    ),
                  ),
                ],
              )
            : const AutoSizeText(
                "uzupełnij dane",
                maxLines: 1,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 22),
              ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(50, 116, 0, 0),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(3, 3)),
          ],
        ),
      ),
    );
  }
}
