import 'package:json_annotation/json_annotation.dart';

part 'adminModel.g.dart';

@JsonSerializable()
class AdminModel {
  AdminModel({
    this.idAdmin,
    this.namaAdmin,
    this.username,
    this.role,
    this.token,
  });

  String idAdmin;
  String namaAdmin;
  String username;
  String role;
  String token;

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdminModelToJson(this);
}
