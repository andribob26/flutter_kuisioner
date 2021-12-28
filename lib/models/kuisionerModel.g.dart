// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kuisionerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KuisionerModel _$KuisionerModelFromJson(Map<String, dynamic> json) {
  return KuisionerModel(
    id: json['id'] as String,
    judulKuisioner: json['judulKuisioner'] as String,
    pertanyaan: (json['pertanyaan'] as List)
        ?.map((e) =>
            e == null ? null : Pertanyaan.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$KuisionerModelToJson(KuisionerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'judulKuisioner': instance.judulKuisioner,
      'pertanyaan': instance.pertanyaan,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

Pertanyaan _$PertanyaanFromJson(Map<String, dynamic> json) {
  return Pertanyaan(
    id: json['_id'] as String,
    judulPertanyaan: json['judulPertanyaan'] as String,
  );
}

Map<String, dynamic> _$PertanyaanToJson(Pertanyaan instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'judulPertanyaan': instance.judulPertanyaan,
    };
