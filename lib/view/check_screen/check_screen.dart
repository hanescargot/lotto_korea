import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_korea/common/layout/base_screen.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/view/check_screen/check_box.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  List<List<bool>> map = List.generate(7, (index) => List<bool>.filled(7,false));

  @override
  Widget build(BuildContext context) {
    return  BaseScreen(child:
      Center(
        child:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, // 열의 수
            // crossAxisSpacing: 4.0, // 열 간의 간격
            mainAxisSpacing: 32.0, // 행 간의 간격
          ),
          itemCount: map.length * map[0].length,
          itemBuilder: (context, index) {
            // int row = index ~/ 7; // 행 인덱스
            // int col = index % 7; // 열 인덱스
            if(index>44){
              return Container();
            }
            return CheckBox(isChecked: (userCheckedNumbers.contains(index)), num: index+1);
          },
        ),
      ),

    );
  }
}
