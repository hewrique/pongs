import 'package:get_it/get_it.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<NavigatorCustomService>(NavigatorCustomService());
}
