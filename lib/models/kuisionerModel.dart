import 'package:json_annotation/json_annotation.dart';

part 'kuisionerModel.g.dart';

@JsonSerializable()
class KuisionerModel {
  KuisionerModel({
    this.id,
    this.judulKuisioner,
    this.pertanyaan,
    this.updatedAt,
    this.createdAt,
  });

  String id;
  String judulKuisioner;
  List<Pertanyaan> pertanyaan;
  DateTime updatedAt;
  DateTime createdAt;

  factory KuisionerModel.fromJson(Map<String, dynamic> json) =>
      _$KuisionerModelFromJson(json);
  Map<String, dynamic> toJson() => _$KuisionerModelToJson(this);
}

@JsonSerializable()
class Pertanyaan {
  Pertanyaan({
    this.id,
    this.judulPertanyaan,
  });

  String id;
  String judulPertanyaan;

  factory Pertanyaan.fromJson(Map<String, dynamic> json) =>
      _$PertanyaanFromJson(json);
  Map<String, dynamic> toJson() => _$PertanyaanToJson(this);
}
