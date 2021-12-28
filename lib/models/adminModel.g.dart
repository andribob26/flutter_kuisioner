// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adminModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) {
  return AdminModel(
    idAdmin: json['idAdmin'] as String,
    namaAdmin: json['namaAdmin'] as String,
    username: json['username'] as String,
    role: json['role'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$AdminModelToJson(AdminModel instance) =>
    <String, dynamic>{
      'idAdmin': instance.idAdmin,
      'namaAdmin': instance.namaAdmin,
      'username': instance.username,
      'role': instance.role,
      'token': instance.token,
    };
