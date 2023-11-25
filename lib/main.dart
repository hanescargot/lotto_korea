import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lotto_korea/common/dio/dio.dart';
import 'package:lotto_korea/common/layout/base_screen.dart';
import 'package:lotto_korea/model/lotto_info_model.dart';
import 'package:lotto_korea/repository/lotto_info_repository.dart';
import 'package:lotto_korea/view/button_screen/button_screen.dart';
import 'package:lotto_korea/view/check_screen/check_box.dart';
import 'package:lotto_korea/view/check_screen/check_screen.dart';
import 'package:lotto_korea/view/table/paginated_data_table.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SliverToBoxAdapter renderTop(){
      return SliverToBoxAdapter(
        child: Container(
          height: 60.h,
          padding: EdgeInsets.only(top: 5.h),
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
          child: Column(
              children: [DataTableExample()],
          ),
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

