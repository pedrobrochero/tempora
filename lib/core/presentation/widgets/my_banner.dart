import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const _bannerTestAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
const mainPageBannerAdUnitId = 'ca-app-pub-4681771972184072/7140438746';

class MyBanner extends StatefulWidget {
  const MyBanner(this.adUnitId, {Key? key}) : super(key: key);
  final String adUnitId;
  @override
  State<MyBanner> createState() => _MyBannerState();
}

// ignore: prefer_mixin
class _MyBannerState extends State<MyBanner> with WidgetsBindingObserver {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;
  bool _shouldShowAd = true;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
    if (kDebugMode) {
      print('initing MyAd ${widget.adUnitId}');
    }
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print('disposing MyAd ${widget.adUnitId}');
    }
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.resumed) {
        _shouldShowAd = true;
      } else {
        _shouldShowAd = false;
      }
    });
  }

  void _initBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: kDebugMode ? _bannerTestAdUnitId : widget.adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          if (kDebugMode) {
            print('error: $error');
          }
        },
      ),
      request: const AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: SizedBox(
          height: _bannerAd.size.height.toDouble(),
          width: _bannerAd.size.width.toDouble(),
          child: _isAdLoaded && _shouldShowAd
              ? AdWidget(ad: _bannerAd)
              : const SizedBox(),
        ),
      );
}
