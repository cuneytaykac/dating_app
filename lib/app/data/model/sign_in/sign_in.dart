import 'package:dating_app/core/network/interfaces/base_network_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class SignIn implements BaseNetworkModel<SignIn> {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? photourl;
  @HiveField(4)
  String? token;

  SignIn({this.id, this.email, this.name, this.photourl, this.token});

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);
  Map<String, dynamic> toJson() => _$SignInToJson(this);

  @override
  SignIn fromJson(Map<String, dynamic> json) {
    return SignIn.fromJson(json);
  }
}
