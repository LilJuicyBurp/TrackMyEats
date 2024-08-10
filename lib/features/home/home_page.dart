import '/data/models/menu_item.dart';
import '/features/home/menu/menu_page.dart';
import '/features/home/pages/main/main_page.dart';
import '/features/home/pages/profile/profile_page.dart';
import '/features/home/pages/scaner_home/scaner_home_page.dart';
import '/service/ad_mob_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../widgets/snackBar/error_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? _bannerAd;

  Future<void> _initBannerAd() async {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId!,
      listener: AdMobService.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    _initBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  MenuElement currentElement = MenuElements.main;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignedOut) {
          context.go("/");
        }
        if (state is AuthError) {
          showErrorSnackBar(state.error, context);
        }
      },
      child: Scaffold(
        body: ZoomDrawer(
          menuScreen: Builder(
            builder: (context) => MenuPage(
              currentElement: currentElement,
              onSelectedElement: (element) {
                setState(() {
                  currentElement = element;
                  ZoomDrawer.of(context)?.close();
                });
              },
            ),
          ),
          mainScreen: _getScreen(),
          menuBackgroundColor: Colors.red,
          showShadow: true,
          angle: -5,
          mainScreenScale: 0,
          borderRadius: 20,
          style: DrawerStyle.style3,
          slideWidth: MediaQuery.of(context).size.width * 0.7,
          mainScreenTapClose: true,
          menuScreenWidth: MediaQuery.of(context).size.width,
          duration: const Duration(milliseconds: 300),
        ),
        bottomNavigationBar: _bannerAd != null
            ? SizedBox(
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(
                  ad: _bannerAd!,
                ),
              )
            : null,
      ),
    );
  }

  Widget _getScreen() {
    switch (currentElement) {
      case MenuElements.main:
        return const MainPage();
      case MenuElements.scanProduct:
        return const ScanerHomePage();
      case MenuElements.profile:
        return const ProfilePage();
    }
    return const MainPage();
  }
}
