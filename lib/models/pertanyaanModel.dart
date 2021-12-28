import 'package:json_annotation/json_annotation.dart';

part 'pertanyaanModel.g.dart';

@JsonSerializable()
class PertanyaanModel {
  PertanyaanModel({
    this.id,
    this.pertanyaan,
    this.updatedAt,
    this.createdAt,
  });

  String id;
  String pertanyaan;
  DateTime updatedAt;
  DateTime createdAt;

  factory PertanyaanModel.fromJson(Map<String, dynamic> json) =>
      _$PertanyaanModelFromJson(json);
  Map<String, dynamic> toJson() => _$PertanyaanModelToJson(this);
}
