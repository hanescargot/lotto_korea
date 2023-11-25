import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/controller/table_data_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
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
          height: 5.h,
        ),
        InkWell(
          onTap: (){
            episodes.clear();
            if(userCheckedNumbers.length==6){
              TableDataController().updateTableData();
            }
            // 프로세스 끝난 뒤
            // userCheckedNumbers = [];
          },
          child: Container(
            width: 40.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(800),
            ),
            child: Center(
                child: Text(
              "시작!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "KCC"),
            )),
          ),
        )
      ],
    );
  }
}
