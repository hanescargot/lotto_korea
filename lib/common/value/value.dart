import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lotto_korea/model/table_info_model.dart';

BannerAd? bannerAd;

List<int> userCheckedNumbers = [];
// List<List<Comparable<Object>>> episodes = <List<Comparable<Object>>>[
//   TableInfoModel(dwrNo: 9, rank: 10, winamnt: 11, drwNos: [23], drwNoDatedwrNo: "25").toComparableList(),
// ];

late WidgetRef mainRef;
late Function updateSorting;
