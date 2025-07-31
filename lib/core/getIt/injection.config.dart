// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../app/data/datasource/local/local_signin/i_local_signin_service.dart'
    as _i818;
import '../../app/data/datasource/local/local_signin/local_signin_service.dart'
    as _i535;
import '../../app/data/datasource/remote/movie/i_movie_service.dart' as _i335;
import '../../app/data/datasource/remote/movie/movie_service.dart' as _i772;
import '../../app/data/datasource/remote/register/i_register_service.dart'
    as _i797;
import '../../app/data/datasource/remote/register/register_service.dart'
    as _i153;
import '../../app/data/datasource/remote/sign_in/i_sign_in_service.dart'
    as _i379;
import '../../app/data/datasource/remote/sign_in/sign_in_service.dart' as _i505;
import '../network/builder/network_manager.dart' as _i455;
import '../network/builder/network_manager_impl.dart' as _i603;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i335.IMovieService>(() => _i772.MovieService());
    gh.lazySingleton<_i818.ILocalSigninService>(
        () => _i535.LocalSigninService());
    gh.lazySingleton<_i797.IRegisterService>(() => _i153.RegisterService());
    gh.factory<_i455.NetworkManager>(() => _i603.NetworkManagerImpl());
    gh.lazySingleton<_i379.ISignInService>(() => _i505.SignInService());
    return this;
  }
}
