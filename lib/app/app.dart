import 'package:flutter_application_1/Ui/Views/Home/Homeview.dart';
import 'package:flutter_application_1/Ui/Views/Screens/SplashScreen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
