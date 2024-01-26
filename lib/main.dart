import 'package:coffee_shop_app_coding_challenge/provider/auth_provider.dart';
import 'package:coffee_shop_app_coding_challenge/provider/common_provider.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/router/route_path.dart';
import 'package:coffee_shop_app_coding_challenge/router/router.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instance.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => CommonProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AppColor.loadLight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(600, 1020),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(fontFamily: 'Sora'),
          title: 'Coffee Shop App',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          onGenerateRoute: generateRoute,
          initialRoute: RoutePath.dashBoard,
        );
      },
    );
  }
}
