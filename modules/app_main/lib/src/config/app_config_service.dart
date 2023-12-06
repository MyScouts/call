import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';

class AppConfigService {
  static String agoraAppID = '';

  static Future init() async {

    ///init agora appID
    final useCase = getIt<UserUsecase>();
    final config = await useCase.getConfig('agoraAppId');
    AppConfigService.agoraAppID =
        config['value'] ?? '9b59830124f54de6b93f0140e88188d9';
  }
}
