import 'package:dating_app/core/result/result.dart';

typedef ResultDecode<K, E extends Exception> = Future<Result<K, E>>;
