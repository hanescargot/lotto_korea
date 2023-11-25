import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/riverpod/state_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckBox extends StatefulWidget {
  final int num;
  const CheckBox({super.key, required this.num});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  double _height = 5.h;
  double _width = 4.h;
  late bool isChecked;

  @override
  Widget build(BuildContext context) {
    return  unit(widget.num);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget  unit(int num) => InkWell(
    onTap: (){
      if(!mainRef.watch(userCheckedNumbers.notifier).state.contains(widget.num)){
        mainRef.watch(userCheckedNumbers.notifier).state.add(widget.num);
      }else{
        mainRef.watch(userCheckedNumbers.notifier).state.remove(widget.num);
      }
      setState(() {

      });
    },
    child: Center(
      child: Container(
        height: _height,
        width: _width,
        child: Stack(
          children: [
             Center(child: Text(num.toString(), style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),maxLines: 1, textAlign: TextAlign.center,)),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                size: Size(_height, _width), // 원하는 크기 지정
                painter: BoxWithBorderPainter(),
              ),),

            Visibility(
              visible: mainRef.watch(userCheckedNumbers.notifier).state.contains(widget.num),
              child: Positioned(
                top: 2,
                bottom: 2,
                left: 2,
                right: 2,
                child: Container(
                  color: Colors.black54,
                ),),
            ),
          ],
        ),
      ),
    ),
  );


}

class BoxWithBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.pink
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path();

    path.moveTo(size.width * 1, size.height * 0.8);
    path.lineTo(size.width * 1, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.8);

    path.moveTo(size.width * 1, size.height * 0.2);
    path.lineTo(size.width * 1, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}