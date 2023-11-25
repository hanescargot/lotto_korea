import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/controller/table_data_controller.dart';
import 'package:lotto_korea/riverpod/state_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonScreen extends ConsumerWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(isLoading);
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        RichText(
            text: TextSpan(
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "YG",
                  color: Colors.black,
                ),
                children: [
              TextSpan(text: "내 로또 번호가 "),
              TextSpan(
                  text: "1등",
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontFamily: "")),
              TextSpan(text: "에 당첨된 적 있는지 확인하기"),
            ])),
        SizedBox(
          height: 2.h,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(800),
          onTap: (){
            if(provider){
              return;
            }
            mainRef.read(tableData.notifier).state.clear();
            if(mainRef.watch(userCheckedNumbers).length==6){
              ref.read(isLoading.notifier).update((state) => true);
              TableDataController().updateTableData();
            }else{
              Fluttertoast.showToast(
                  msg: "번호 6개를 체크해 주세요",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          },
          child: Container(
            width: 40.h,
            height: 10.h,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(800),
            ),
            child: Center(
                child: Text(
                  provider?"Loading ..":"시작!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize:20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "KCC"),
            )),
          ),
        )
      ],
    );
  }
}
