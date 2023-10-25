import 'package:app_main/app_main.dart';
import 'package:environments/environments.dart';

void main(List<String> args) {
  environmentProd.addAll({'isStudio': false});
  AppDelegate().run(environmentProd);
}
