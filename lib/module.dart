import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvels/app/detail/module.dart';
import 'package:marvels/app/list/module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          "/",
          module: ListModule(),
        ),
        ModuleRoute(
          "/detail",
          module: DetailModule(),
        )
      ];
}
