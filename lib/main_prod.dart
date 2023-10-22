import 'package:base_clean_architecture/src/app_delegate.dart';
import 'package:base_clean_architecture/src/config/enviroments/env_prod.dart';

void main(List<String> args) {
  environmentProd.addAll({'isStudio': false});

  AppDelegate().run(environmentProd);
}
