import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:lotto_korea/model/lotto_info_model.dart';
import 'package:retrofit/http.dart';

part 'lotto_info_repository.g.dart';


@RestApi()
abstract class LottoInfoRepository{
  factory LottoInfoRepository(Dio dio, {String baseUrl})
  = _LottoInfoRepository;

  // @GET('/')
  // paginate();

  // @Headers({'Content-Type': 'application/json'})
  @GET('/common.do?method=getLottoNumber&drwNo={drwNo}')
  Future<LottoInfoModel?> getLottoInfoModel(
      {@Path() required int drwNo,}
      );
}