import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_export.dart';
import 'core/utils/navigator_service.dart';
import 'core/utils/pref_utils.dart';
import 'core/utils/size_utils.dart';
import 'presentation/Recharge/cubit/recharge_form_cubit.dart';
import 'presentation/pageLayout/cubit/tab_manager_cubit.dart';
import 'routes/app_routes.dart';
import 'routes/route_path.dart';
import 'theme/provider/theme_provider.dart';
import 'theme/theme_helper.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          BlocProvider(create: (_) => RechargeFormCubit()),
          BlocProvider(create: (_) => TabManagerCubit()),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return Consumer<ThemeProvider>(
              builder: (context, provider, child) {
                return MaterialApp(
                  title: 'NDPC -NXpY',
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  navigatorKey: NavigatorService.navigatorKey,
                  // localizationsDelegates: [
                  //   AppLocalizationDelegate(),
                  //   GlobalMaterialLocalizations.delegate,
                  //   GlobalWidgetsLocalizations.delegate,
                  //   GlobalCupertinoLocalizations.delegate
                  // ],
                  supportedLocales: const [Locale('en', '')],

                  // initial routing to splash screen
                  initialRoute: RoutesName.homePage_screen,
                  // path to generating routes
                  onGenerateRoute: AppRoutes.generateRoutes,
                );
              },
            );
          },
        ));
  }
}
