import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

// short const => @microPackageInit
@InjectableInit.microPackage(
  externalPackageModulesBefore: [
    ExternalModule(MobilehubCorePackageModule),
  ],
)
void initAppCoreMicroPackage() {} // will not be called
