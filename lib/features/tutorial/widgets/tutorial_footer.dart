// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialFooter extends StatefulWidget {
  final double height;
  final PageController pageController;
  final int pageCount;
  const TutorialFooter({
    Key? key,
    required this.height,
    required this.pageController,
    required this.pageCount,
  }) : super(key: key);

  @override
  State<TutorialFooter> createState() => _TutorialFooterState();
}

class _TutorialFooterState extends State<TutorialFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: widget.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            onPressed: () => widget.pageController.animateToPage(
              widget.pageCount - 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text("SKIP"),
          ),
          SmoothPageIndicator(
            controller: widget.pageController,
            count: widget.pageCount,
            effect: const WormEffect(
              dotColor: Color.fromARGB(190, 158, 158, 158),
              activeDotColor: Colors.white,
            ),
            onDotClicked: (index) => widget.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut),
          ),
          TextButton(
            onPressed: () => widget.pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInCubic),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text("NEXT"),
          ),
        ],
      ),
    );
  }
}
