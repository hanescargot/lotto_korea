import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lotto_korea/common/const/const_value.dart';
import 'package:lotto_korea/common/dio/dio.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/model/lotto_info_model.dart';
import 'package:lotto_korea/model/table_info_model.dart';
import 'package:lotto_korea/repository/lotto_info_repository.dart';
import 'package:lotto_korea/riverpod/state_provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TableDataController{
  getRank(List<int> user, List<int> result, int bNum){
    int count = 0;
    for(int i = 0; i<6; i++){
      if(result.contains(user[i])){
        count++;
      }
    }

    switch(count){
      case 6 :
        return 1;
      case 5 :
        if(user.contains(bNum)){
          return 2;
        }else{
          return 3;
        }
      case 4 :
        return 4;
      case 3 :
        return 5;
      default :
        return 6;
    }
  }
  getWinamnt(int rank, double firstWinamnt){
    switch(rank){
      case 1 :
        return firstWinamnt.toInt();
      case 2 :
        return 0;
      case 3 :
        return 0;
      case 4 :
        return 50000;
      case 5 :
        return 5000;
      default :
        return 0;
    }
  }

  checkNumbers(LottoInfoRepository lir)async{
    for(int i=1; i<2000; i++){
      LottoInfoModel? lim;
      try {
        // 내부저장소에 있는지 확인
        if(prefs.containsKey(i.toString())){
          final String? action = prefs.getString('$i');
          if(action == null){
            lim = await lir.getLottoInfoModel(drwNo: i);
          }else{

            lim = LottoInfoModel.fromJson(jsonDecode(action));
          }
        }else{
          lim = await lir.getLottoInfoModel(drwNo: i);
          prefs.setString(i.toString(), jsonEncode(lim));
        }

        if(lim == null){
          break;
        }
      }catch(e){
        // 마지막 회차

        mainRef.read(isLoading.notifier).update((state) => false);
        break;
      }
      List<int> drwNos = [lim.drwtNo1,lim.drwtNo2,lim.drwtNo3,lim.drwtNo4,lim.drwtNo5,lim.drwtNo6];
      int rank = getRank(mainRef.watch(userCheckedNumbers), drwNos, lim.bnusNo,);
      int winamnt = getWinamnt(rank, lim.firstWinamnt);

      if(rank<6){
        mainRef.read(tableData.notifier).state
            .add(TableInfoModel(dwrNo: lim.drwNo, rank: rank, winamnt: winamnt, drwNos: drwNos, drwNoDatedwrNo: lim.drwNoDate, ).toComparableList());
        updateSorting();
      }

    }
  }


  updateTableData()async {
    Dio dio = Dio();
    dio.interceptors.add(CustomInterceptor());
    LottoInfoRepository lir = LottoInfoRepository(dio, baseUrl: 'https://www.dhlottery.co.kr');

    checkNumbers(lir);

  }
}