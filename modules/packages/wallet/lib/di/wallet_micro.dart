import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt injector = GetIt.instance;

// short const => @microPackageInit
@InjectableInit.microPackage()
void initWalletMicroPackage() {} // will not be called
