import 'package:coffee_shop_app_coding_challenge/provider/auth_provider.dart';
import 'package:coffee_shop_app_coding_challenge/provider/home_provider.dart';
import 'package:coffee_shop_app_coding_challenge/router/route_path.dart';
import 'package:coffee_shop_app_coding_challenge/router/router.dart';
import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:coffee_shop_app_coding_challenge/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.instance.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
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
  // HomeProvider? _homeProvider;
  String? theme;

  @override
  void initState() {
    super.initState();
    // _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    // _homeProvider?.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    AppColor.loadLight();
    return const MaterialApp(
      title: 'Coffee Shop App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      onGenerateRoute: generateRoute,
      initialRoute: RoutePath.dashBoard,
    );
  }
}
