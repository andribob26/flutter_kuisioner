// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaModel _$MahasiswaModelFromJson(Map<String, dynamic> json) {
  return MahasiswaModel(
    idMhs: json['idMhs'] as String,
    namaMhs: json['namaMhs'] as String,
    nim: json['nim'] as String,
    token: json['token'] as String,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$MahasiswaModelToJson(MahasiswaModel instance) =>
    <String, dynamic>{
      'idMhs': instance.idMhs,
      'namaMhs': instance.namaMhs,
      'nim': instance.nim,
      'token': instance.token,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
