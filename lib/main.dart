import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lotto_korea/common/dio/dio.dart';
import 'package:lotto_korea/model/lotto_info_model.dart';
import 'package:lotto_korea/repository/lotto_info_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future fetchData({required int drwNo}) async {
    final dio = Dio();
    dio.interceptors.add(CustomInterceptor());

    // Response? res = await dio.get("https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=${}");
    LottoInfoRepository lir = LottoInfoRepository(dio, baseUrl:'http://www.dhlottery.co.kr');
    LottoInfoModel? resp = await lir.getLottoInfoModel(drwNo: drwNo);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API 통신 예제'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){fetchData(drwNo: 100);},
          child: Text('API 호출'),
        ),
      ),
    );
  }
}
