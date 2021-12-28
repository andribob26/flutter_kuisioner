import 'package:json_annotation/json_annotation.dart';

part 'mahasiswaModel.g.dart';

@JsonSerializable()
class MahasiswaModel {
  MahasiswaModel({
    this.idMhs,
    this.namaMhs,
    this.nim,
    this.token,
    this.updatedAt,
    this.createdAt,
  });

  String idMhs;
  String namaMhs;
  String nim;
  String token;
  DateTime updatedAt;
  DateTime createdAt;

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaModelToJson(this);
}
