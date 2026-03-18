import 'package:json_annotation/json_annotation.dart';

part 'error_container.g.dart';

@JsonSerializable()
class ErrorContainer {
  ErrorContainer(this.message, this.error);

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'error')
  final String? error;

  factory ErrorContainer.fromJson(Map<String, dynamic> json) =>
      _$ErrorContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorContainerToJson(this);
}
