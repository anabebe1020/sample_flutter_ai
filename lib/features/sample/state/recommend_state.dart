import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_state.freezed.dart';

@freezed
abstract class RecommendState with _$RecommendState {
  const factory RecommendState({
    @Default(false) bool isLoading,
    List<String>? responseText,
  }) = _RecommendState;
}
