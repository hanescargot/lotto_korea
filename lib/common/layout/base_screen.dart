import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BaseScreen extends ConsumerWidget {
  final Widget child;
  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mainRef = ref;
    return Scaffold(body: SafeArea(child: Stack(
      children: [
        Center(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: child,
        )),
        if (bannerAd != null)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: bannerAd!.size.width.toDouble(),
              height: bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: bannerAd!),
            ),
          ),
      ],
    )));
  }
}
