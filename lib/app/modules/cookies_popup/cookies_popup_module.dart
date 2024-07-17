import 'package:flutter_modular/flutter_modular.dart';
import 'package:popups/app/modules/cookies_popup/cookies_popup_page.dart';
import 'package:popups/app/modules/cookies_popup/cookies_popup_store.dart';

class CookiesPopupModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CookiesPopupStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CookiesPopupPage()),
  ];
}
