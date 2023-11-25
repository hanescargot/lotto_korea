class TableInfoModel{
  final int dwrNo;
  final int rank; // 등수
  final double winamnt;// 상금
  final List<int>drwNos; // 당첨번호 + 보너스 번호

  final String drwNoDatedwrNo;

  TableInfoModel({required this.dwrNo, required this.rank, required this.winamnt, required this.drwNos, required this.drwNoDatedwrNo, });

  List<Comparable<Object>> toComparableList() {
    return [dwrNo, rank, winamnt, ...drwNos, drwNoDatedwrNo];
  }
}