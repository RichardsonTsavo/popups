import 'package:flutter_modular/flutter_modular.dart';

import 'modules/cookies_popup/cookiesPopup_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule(), transition: TransitionType.fadeIn),
    ModuleRoute('/cookies',
        module: CookiesPopupModule(), transition: TransitionType.fadeIn)
  ];
}
