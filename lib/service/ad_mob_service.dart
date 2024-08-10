import 'dart:io' show Platform;

import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get bannerAdUnitId {
    return "ca-app-pub-3940256099942544/6300978111";
    // if (Platform.isAndroid) {
    //   return "ca-app-pub-5166777989324584/3029929031";
    // }
    // if (Platform.isIOS) {
    //   return "ca-app-pub-5166777989324584/7779429500";
    // }
    // return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      //ca-app-pub-5166777989324584~1980307919
      return "ca-app-pub-5166777989324584/4491238410";
    }
    if (Platform.isIOS) {
      //ca-app-pub-5166777989324584~1405592842
      return "ca-app-pub-5166777989324584/1077718961";
    }
    return null;
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad loaded'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened'),
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
}
