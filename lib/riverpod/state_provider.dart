import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lotto_korea/model/lotto_info_model.dart';

final isLoading = StateProvider<bool>((ref) => false);
final isHistoryLoading = StateProvider<bool>((ref) => true);
final tableData = StateProvider<List<List<Comparable<Object>>>>((ref) => []);
final userCheckedNumbers = StateProvider<List<int>>((ref) => []);