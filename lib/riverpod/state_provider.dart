import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoading = StateProvider<bool>((ref) => false);
final tableData = StateProvider<List<List<Comparable<Object>>>>((ref) => []);