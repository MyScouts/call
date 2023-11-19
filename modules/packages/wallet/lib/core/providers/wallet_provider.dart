import 'package:app_core/app_core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networking/interceptors/api_token_interceptor.dart';

class WalletProvider {
  late Dio dio;

  WalletProvider(
    String baseUrl,
    SharedPreferences sharedPreferences,
  ) {
    dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors
          .add(ApiTokenInterceptor(sharedPreferences, onLogout: onLogout));
  }

  final onLogout = BehaviorSubject();
}
