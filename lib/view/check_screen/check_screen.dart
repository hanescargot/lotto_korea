import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_korea/common/layout/base_screen.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/riverpod/state_provider.dart';
import 'package:lotto_korea/view/check_screen/check_box.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  List<List<bool>> map = List.generate(7, (index) => List<bool>.filled(7,false));

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:60.h,
      child:  Stack(
        children: [
          GridView.builder(

            physics: NeverScrollableScrollPhysics(), // 스크롤 금지
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, // 열의 수
              crossAxisSpacing: 1.h, // 열 간의 간격
              mainAxisSpacing: 1.h, // 행 간의 간격
            mainAxisExtent: 7.h,
            ),
            itemCount: map.length * map[0].length,
            itemBuilder: (context, index) {
              // int row = index ~/ 7; // 행 인덱스
              // int col = index % 7; // 열 인덱스
              if(index>44){
                return Container();
              }
              return CheckBox(num: index+1);
            },
          ),

      Positioned(
        bottom: 3.h,
        right: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(800),
          onTap: (){
              mainRef.read(userCheckedNumbers.notifier).state.clear();
              mainRef.read(tableData.notifier).state.clear();
              setState(() {
              });
              updateSorting();
          },
    child: Icon(Icons.change_circle_outlined, color: Colors.pink,size: 12.w,),
      ),
    )
        ],
      ),
    );
  }
}
