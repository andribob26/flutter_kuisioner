// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dosenModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DosenModel _$DosenModelFromJson(Map<String, dynamic> json) {
  return DosenModel(
    id: json['id'] as String,
    namaDosen: json['namaDosen'] as String,
    nip: json['nip'] as int,
    noTelepon: json['noTelepon'] as int,
    email: json['email'] as String,
    kuisioner: (json['kuisioner'] as List)
        ?.map((e) =>
            e == null ? null : Kuisioner.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DosenModelToJson(DosenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaDosen': instance.namaDosen,
      'nip': instance.nip,
      'noTelepon': instance.noTelepon,
      'email': instance.email,
      'kuisioner': instance.kuisioner,
    };

Kuisioner _$KuisionerFromJson(Map<String, dynamic> json) {
  return Kuisioner(
    idMhs: json['idMhs'] as String,
    namaMhs: json['namaMhs'] as String,
    idKuisioner: json['idKuisioner'] as String,
    judulKuisioner: json['judulKuisioner'] as String,
    hasilKuis: (json['hasilKuis'] as List)
        ?.map((e) =>
            e == null ? null : HasilKui.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$KuisionerToJson(Kuisioner instance) => <String, dynamic>{
      'idMhs': instance.idMhs,
      'namaMhs': instance.namaMhs,
      'idKuisioner': instance.idKuisioner,
      'judulKuisioner': instance.judulKuisioner,
      'hasilKuis': instance.hasilKuis,
    };

HasilKui _$HasilKuiFromJson(Map<String, dynamic> json) {
  return HasilKui(
    id: json['_id'] as String,
    sangatBaik: json['sangatBaik'] as int,
    baik: json['baik'] as int,
    cukup: json['cukup'] as int,
    kurang: json['kurang'] as int,
    sangatKurang: json['sangatKurang'] as int,
  );
}

Map<String, dynamic> _$HasilKuiToJson(HasilKui instance) => <String, dynamic>{
      '_id': instance.id,
      'sangatBaik': instance.sangatBaik,
      'baik': instance.baik,
      'cukup': instance.cukup,
      'kurang': instance.kurang,
      'sangatKurang': instance.sangatKurang,
    };
