import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';
import 'app/widgets/app_not_found.dart';

// import 'app/data/services/service_notification/service_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Always initialize Awesome Notifications
  // await ServiceNotification.initialNotif();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MaterialApp.router(
      title: 'Chamjo Mobile',
      theme: appTheme,
      darkTheme: appTheme,
      routerConfig: AppRoutes.route,
      builder: (ctx, child) {
        return child ?? const AppNotFound();
      },
    );
  }
}
