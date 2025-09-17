// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camp_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampQuery _$CampQueryFromJson(Map<String, dynamic> json) => _CampQuery(
  season: json['season'] as String,
  region: json['region'] as String,
  nights: (json['nights'] as num?)?.toInt() ?? 2,
  people: (json['people'] as num?)?.toInt() ?? 2,
  transport: json['transport'] as String? ?? '車',
  maxDriveHours: (json['maxDriveHours'] as num?)?.toDouble() ?? 2.0,
  mustHave:
      (json['mustHave'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  niceToHave:
      (json['niceToHave'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  budgetNote: json['budgetNote'] as String? ?? '',
);

Map<String, dynamic> _$CampQueryToJson(_CampQuery instance) =>
    <String, dynamic>{
      'season': instance.season,
      'region': instance.region,
      'nights': instance.nights,
      'people': instance.people,
      'transport': instance.transport,
      'maxDriveHours': instance.maxDriveHours,
      'mustHave': instance.mustHave,
      'niceToHave': instance.niceToHave,
      'budgetNote': instance.budgetNote,
    };
