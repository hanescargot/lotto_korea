import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto_korea/common/const/const_value.dart';
import 'package:lotto_korea/common/dio/dio.dart';
import 'package:lotto_korea/common/layout/base_screen.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/model/lotto_info_model.dart';
import 'package:lotto_korea/repository/lotto_info_repository.dart';
import 'package:lotto_korea/riverpod/state_provider.dart';
import 'package:lotto_korea/view/button_screen/button_screen.dart';
import 'package:lotto_korea/view/check_screen/check_box.dart';
import 'package:lotto_korea/view/check_screen/check_screen.dart';
import 'package:lotto_korea/view/table/paginated_data_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ad_helper.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  initSetting()async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSetting();
    // BannerAd(
    //   adUnitId: AdHelper.bannerAdUnitId,
    //   request: AdRequest(),
    //   size: AdSize.banner,
    //   listener: BannerAdListener(
    //     onAdLoaded: (ad) {
    //       setState(() {
    //         bannerAd  = ad as BannerAd;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, err) {
    //       print('Failed to load a banner ad: ${err.message}');
    //       ad.dispose();
    //     },
    //   ),
    // ).load();
  }

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    bannerAd?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SliverToBoxAdapter renderTop(){
      return SliverToBoxAdapter(
        child: Container(
          height: 60.h,
          padding: EdgeInsets.only(top: 1.h),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(4.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.5,
                  child: CheckScreen()),
              SizedBox(width: 16,),
              Expanded(child: ButtonScreen()),
            ],
          ),
        ),
      );
    }

    SliverToBoxAdapter renderBottom(){
      return SliverToBoxAdapter(
        child:Container(
          color: Colors.grey,
          child: DataTableExample(),
        ),
      );
    }


    return ResponsiveSizer(
        builder: (context, orientation, screenType)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BaseScreen(
          child: CustomScrollView(
            slivers: [
                  renderTop(),
                  renderBottom()
            ],
          ),
        ),
      );
    }
    );
  }
}

