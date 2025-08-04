import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/app/data/model/sign_in/sign_in.dart';
import 'package:dating_app/core/firebase/crashlytics/crashlytics_manager.dart';
import 'package:dating_app/core/utility/cache/cache_manager.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ILocalSigninService)
final class LocalSigninService extends ILocalSigninService {
  @override
  Future<void> clearSignIn() async {
    try {
      await HiveHelper.shared.clear<SignIn>(boxName: HiveHelper.signInBoxKey);
    } catch (e) {
      CrashlyticsManager.instance.sendACrash(
        error: '$e',
        stackTrace: StackTrace.current,
        reason: "Reason clearSignIn",
        isFatal: true,
      );
    }
  }

  @override
  Future<String> getToken() async {
    try {
      final signIn = HiveHelper.shared.getData<SignIn>(
        boxName: HiveHelper.signInBoxKey,
        key: HiveHelper.signInKey,
      );
      return signIn?.token ?? '';
    } catch (e) {
      CrashlyticsManager.instance.sendACrash(
        error: '$e',
        stackTrace: StackTrace.current,
        reason: "Reason getToken",
        isFatal: true,
      );
      return '';
    }
  }

  @override
  Future<void> saveSignIn(SignIn signIn) async {
    try {
      await HiveHelper.shared.clear<SignIn>(boxName: HiveHelper.signInBoxKey);
      await HiveHelper.shared.put<SignIn>(
        boxName: HiveHelper.signInBoxKey,
        data: signIn,
        key: HiveHelper.signInKey,
      );
    } catch (e) {
      CrashlyticsManager.instance.sendACrash(
        error: '$e',
        stackTrace: StackTrace.current,
        reason: "Reason saveSignIn",
        isFatal: true,
      );
    }
  }

  @override
  Future<SignIn?> getSignInData() async {
    try {
      final signIn = HiveHelper.shared.getData<SignIn>(
        boxName: HiveHelper.signInBoxKey,
        key: HiveHelper.signInKey,
      );
      return signIn;
    } catch (e) {
      CrashlyticsManager.instance.sendACrash(
        error: '$e',
        stackTrace: StackTrace.current,
        reason: "Reason getSignInData",
        isFatal: true,
      );
      return null;
    }
  }
}
