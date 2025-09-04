import 'package:freezed_annotation/freezed_annotation.dart';

part 'camp_query.freezed.dart';
part 'camp_query.g.dart';

@freezed
abstract class CampQuery with _$CampQuery {
  const factory CampQuery({
    required String season, // '春', '夏', '秋', '冬'
    required String region, // '関東', '関西' など
    @Default(2) int nights,
    @Default(2) int people,
    @Default('車') String transport,
    @Default(2.0) double maxDriveHours, // 自宅からの運転許容時間
    @Default(<String>[]) List<String> mustHave, // 直火/電源/温泉/川遊び など
    @Default(<String>[]) List<String> niceToHave,
    @Default('') String budgetNote,
  }) = _CampQuery;

  factory CampQuery.fromJson(Map<String, dynamic> json) =>
      _$CampQueryFromJson(json);
}
