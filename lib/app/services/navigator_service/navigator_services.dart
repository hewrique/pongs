import 'package:flutter/material.dart';
import 'package:pongs/app/services/service_locator/service_locator.dart';


abstract class NavigatorServices {
  static GlobalKey<NavigatorState> get key =>
      getIt.get<GlobalKey<NavigatorState>>();
}