// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pertanyaanModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PertanyaanModel _$PertanyaanModelFromJson(Map<String, dynamic> json) {
  return PertanyaanModel(
    id: json['_id'] as String,
    pertanyaan: json['pertanyaan'] as String,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$PertanyaanModelToJson(PertanyaanModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'pertanyaan': instance.pertanyaan,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
