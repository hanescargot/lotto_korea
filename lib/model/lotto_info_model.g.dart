// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lotto_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LottoInfoModel _$LottoInfoModelFromJson(Map<String, dynamic> json) =>
    LottoInfoModel(
      drwNoDate: json['drwNoDate'] as String,
      totSellamnt: (json['totSellamnt'] as num).toDouble(),
      firstWinamnt: (json['firstWinamnt'] as num).toDouble(),
      firstPrzwnerCo: json['firstPrzwnerCo'] as int,
      firstAccumamnt: json['firstAccumamnt'] as int,
      drwtNo1: json['drwtNo1'] as int,
      drwtNo2: json['drwtNo2'] as int,
      drwtNo3: json['drwtNo3'] as int,
      drwtNo4: json['drwtNo4'] as int,
      drwtNo5: json['drwtNo5'] as int,
      drwtNo6: json['drwtNo6'] as int,
      bnusNo: json['bnusNo'] as int,
      drwNo: json['drwNo'] as int,
      returnValue: json['returnValue'] as String,
    );

Map<String, dynamic> _$LottoInfoModelToJson(LottoInfoModel instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'drwNoDate': instance.drwNoDate,
      'totSellamnt': instance.totSellamnt,
      'firstWinamnt': instance.firstWinamnt,
      'firstPrzwnerCo': instance.firstPrzwnerCo,
      'firstAccumamnt': instance.firstAccumamnt,
      'drwtNo1': instance.drwtNo1,
      'drwtNo2': instance.drwtNo2,
      'drwtNo3': instance.drwtNo3,
      'drwtNo4': instance.drwtNo4,
      'drwtNo5': instance.drwtNo5,
      'drwtNo6': instance.drwtNo6,
      'bnusNo': instance.bnusNo,
      'drwNo': instance.drwNo,
    };
