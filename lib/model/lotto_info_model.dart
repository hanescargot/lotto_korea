// {
// "returnValue":"success",			// 요청결과
// "drwNoDate":"2004-10-30",			// 날짜
// "totSellamnt":56561977000,			// 총상금액
// "firstWinamnt":3315315525,			// 1등 상금액
// "firstPrzwnerCo":4,				// 1등 당첨인원
// "firstAccumamnt":0,
// "drwtNo1":1,					// 로또번호 1
// "drwtNo2":7,					// 로또번호 2
// "drwtNo3":11,					// 로또번호 3
// "drwtNo4":23,					// 로또번호 4
// "drwtNo5":37,					// 로또번호 5
// "drwtNo6":42,					// 로또번호 6
// "bnusNo":6,					// 로또 보너스 번호
// "drwNo":100					// 로또회차
// }
// {"returnValue":"fail"}
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'lotto_info_model.g.dart';

@JsonSerializable()
class LottoInfoModel{
  final String? returnValue;
  final String? drwNoDate;
  final double? totSellamnt;
  final double? firstWinamnt;
  final int? firstPrzwnerCo;
  final int? firstAccumamnt;
  final int drwtNo1;
  final int drwtNo2;
  final int drwtNo3;
  final int drwtNo4;
  final int drwtNo5;
  final int drwtNo6;
  final int bnusNo;
  final int? drwtNo;

  LottoInfoModel({required this.drwNoDate, required this.totSellamnt, required this.firstWinamnt, required this.firstPrzwnerCo, required this.firstAccumamnt, required this.drwtNo1, required this.drwtNo2, required this.drwtNo3, required this.drwtNo4, required this.drwtNo5, required this.drwtNo6, required this.bnusNo, required this.drwtNo, required this.returnValue});

//   // 생성자처럼 클래스의 인스턴스를 생성할 수 있지만, 항상 새로운 인스턴스를 생성하는 것이 아니라 이미 생성된 인스턴스를 반환
// factory LottoInfoModel.fromJson({required Map<String, dynamic> json}){
//   return LottoInfoModel(drwNoDate: json[''], totSellamnt: totSellamnt, firstWinamnt: firstWinamnt, firstPrzwnerCo: firstPrzwnerCo, firstAccumamnt: firstAccumamnt, drwtNo1: drwtNo1, drwtNo2: drwtNo2, drwtNo3: drwtNo3, drwtNo4: drwtNo4, drwtNo5: drwtNo5, drwtNo6: drwtNo6, bnusNo: bnusNo, drwtNo: drwtNo, returnValue: returnValue)
// }

factory LottoInfoModel.fromJson(Map<String, dynamic> json)=>_$LottoInfoModelFromJson(json);

Map<String, dynamic> toJson() => _$LottoInfoModelToJson(this);

}
