import 'package:dating_app/app/data/model/sign_in/sign_in.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/interfaces/base_network_model.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
final class SignInResponse implements BaseNetworkModel<SignInResponse> {
  final SignIn? data;

  SignInResponse({this.data});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

  @override
  SignInResponse fromJson(Map<String, dynamic> json) {
    return SignInResponse.fromJson(json);
  }
}
