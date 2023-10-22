import 'package:base_clean_architecture/src/app_delegate.dart';
import 'package:base_clean_architecture/src/config/enviroments/env_dev.dart';

void main(List<String> args) {
  environmentDev.addAll({'isStudio': true});

  AppDelegate().run(environmentDev);
}
