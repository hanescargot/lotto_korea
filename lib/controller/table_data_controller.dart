import 'package:lotto_korea/common/value/value.dart';
import 'package:lotto_korea/model/table_info_model.dart';

class TableDataController{
  updateTableData(){
    print("!!!");
    episodes.add(TableInfoModel(dwrNo: 66, rank: 7, winamnt: 8, drwNos: [9], drwNoDatedwrNo: "99").toComparableList());
  }
}