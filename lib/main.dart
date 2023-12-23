import 'package:environments/environments.dart';
import 'package:app_main/app_main.dart';

void main(List<String> args) {
  environmentDev.addAll({'isStudio': true});

  AppDelegate().run(environmentDev);
}
