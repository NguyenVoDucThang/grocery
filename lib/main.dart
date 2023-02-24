import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kid_shop/global/providers.dart';
import 'package:kid_shop/ui/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

import 'global/locator.dart';
import 'global/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 855),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [...viewModelProviders],
          child: GetMaterialApp(
            title: 'Kid Shop',
            navigatorKey: NavigationUtils.navigatorKey,
            onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(),
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.white,
            ),
            initialRoute: MyRouter.splashScreen,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
