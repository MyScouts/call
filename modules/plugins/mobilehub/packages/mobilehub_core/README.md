# Welcom to mobile hub core
v0.0.1

---

## Add dependency injection
Add line externalPackageModule: `ExternalModule(MobilehubCorePackageModule),` 
```
GetIt injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
  externalPackageModulesAfter: [
    ExternalModule(MobilehubCorePackageModule),
  ],
)
Future<void> configureDependencies({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async =>
    init(injector,
        environment: environment, environmentFilter: environmentFilter);

```