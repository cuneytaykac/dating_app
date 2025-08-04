import 'package:dating_app/app/data/model/sign_in/sign_in.dart';

abstract class ILocalSigninService {
  Future<void> saveSignIn(SignIn signIn);
  Future<String> getToken();
  Future<void> clearSignIn();
  Future<SignIn?> getSignInData();
}
