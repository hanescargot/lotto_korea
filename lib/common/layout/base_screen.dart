import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/riverpod/state_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/table_data_controller.dart';
import '../const/const_value.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  const BaseScreen({super.key, required this.child});
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
  bool  isF = false;
  @override
  Widget build(BuildContext context) {
      return Scaffold(body: SafeArea(child: Consumer(
        builder: (_,ref,__) {
          mainRef = ref;

          if(!isF){
            // 미리 로또 정보 가져오기
            TableDataController().loadHistory(ref);

            controller = AnimationController(
              /// [AnimationController]s can be created with `vsync: this` because of
              /// [TickerProviderStateMixin].
              vsync: this,
              duration: const Duration(seconds: 25),
            )..addListener(() {
              setState(() {});
            });
            // controller.repeat(reverse: true);
            controller.repeat();

            isF = true;
          }
          return Stack(
            children: [
              Center(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: widget.child,
              )),
              if (bannerAd != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: bannerAd!.size.width.toDouble(),
                    height: bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd!),
                  ),
                ),
              Visibility(
                  visible: mainRef.watch(isHistoryLoading),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("asset/logo.png", width: 24.h, height: 24.h,),
                        SizedBox(height: 12.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.w),
                          child: LinearProgressIndicator(
                            value: controller.value,
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Text("필요한 리소스들을 불러오는 중 입니다.", style: TextStyle(fontFamily: "YG"
                            ),),
                      ],
                    ),
                  )
              )
            ],
          );
        }
      )));
  }
}
