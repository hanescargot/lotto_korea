import 'package:dio/dio.dart';
import 'package:lotto_korea/common/dio/dio.dart';
import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/model/lotto_info_model.dart';
import 'package:lotto_korea/model/table_info_model.dart';
import 'package:lotto_korea/repository/lotto_info_repository.dart';

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


  updateTableData()async {
    print("!!!");
    Dio dio = Dio();
    dio.interceptors.add(CustomInterceptor());
    LottoInfoRepository lir = LottoInfoRepository(dio, baseUrl: 'https://www.dhlottery.co.kr');


    for(int i=1; i<2000; i++){
      LottoInfoModel? lim = await lir.getLottoInfoModel(drwNo: i);
      if(lim==null){
        break;
      }
      List<int> drwNos = [lim.drwtNo1,lim.drwtNo2,lim.drwtNo3,lim.drwtNo4,lim.drwtNo5,lim.drwtNo6];
      int rank = getRank(userCheckedNumbers, drwNos, lim.bnusNo,);
      int winamnt = getWinamnt(rank, lim.firstWinamnt);

      if(rank<6){
        episodes.add(TableInfoModel(dwrNo: lim.drwNo, rank: rank, winamnt: winamnt, drwNos: drwNos, drwNoDatedwrNo: lim.drwNoDate, ).toComparableList());
      }

    }


    // episodes.add(TableInfoModel(dwrNo: 66, rank: 7, winamnt: 8, drwNos: [9], drwNoDatedwrNo: "99").toComparableList());

  }
}