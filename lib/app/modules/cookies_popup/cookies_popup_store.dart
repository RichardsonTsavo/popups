import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cookies_popup_store.g.dart';

class CookiesPopupStore = _CookiesPopupStoreBase with _$CookiesPopupStore;

abstract class _CookiesPopupStoreBase with Store {
  AnimationController? aninController;
}
