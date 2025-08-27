// 現在のページインデックスを管理
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentPageProvider = StateProvider<int>((ref) => 0);
