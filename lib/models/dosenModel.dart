import 'package:json_annotation/json_annotation.dart';

part 'dosenModel.g.dart';

@JsonSerializable()
class DosenModel {
  DosenModel({
    this.id,
    this.namaDosen,
    this.nip,
    this.noTelepon,
    this.email,
    this.kuisioner,
  });

  String id;
  String namaDosen;
  int nip;
  int noTelepon;
  String email;
  List<Kuisioner> kuisioner;

  factory DosenModel.fromJson(Map<String, dynamic> json) =>
      _$DosenModelFromJson(json);
  Map<String, dynamic> toJson() => _$DosenModelToJson(this);
}

@JsonSerializable()
class Kuisioner {
  Kuisioner({
    this.idMhs,
    this.namaMhs,
    this.idKuisioner,
    this.judulKuisioner,
    this.hasilKuis,
  });

  String idMhs;
  String namaMhs;
  String idKuisioner;
  String judulKuisioner;
  List<HasilKui> hasilKuis;

  factory Kuisioner.fromJson(Map<String, dynamic> json) =>
      _$KuisionerFromJson(json);
  Map<String, dynamic> toJson() => _$KuisionerToJson(this);
}

@JsonSerializable()
class HasilKui {
  HasilKui({
    this.id,
    this.sangatBaik,
    this.baik,
    this.cukup,
    this.kurang,
    this.sangatKurang,
  });

  String id;
  int sangatBaik;
  int baik;
  int cukup;
  int kurang;
  int sangatKurang;

  factory HasilKui.fromJson(Map<String, dynamic> json) =>
      _$HasilKuiFromJson(json);
  Map<String, dynamic> toJson() => _$HasilKuiToJson(this);
}
