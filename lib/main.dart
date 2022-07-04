import 'package:academybw/initial_page.dart';
import 'package:academybw/providers/auth_provider.dart';
import 'package:academybw/providers/menu_provider.dart';
import 'package:academybw/providers/post_provider.dart';
import 'package:academybw/providers/videos_provider.dart';
import 'package:academybw/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

double sizeH = 0;
double sizeW = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await SharedPreferencesLocal.configurePrefs();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false,create: ( _ ) => AuthProvider()),
        ChangeNotifierProvider(lazy: false,create: ( _ ) => MenuProvider()),
        ChangeNotifierProvider(lazy: false,create: ( _ ) => PostProvider()),
        ChangeNotifierProvider(lazy: false,create: ( _ ) => VideosProvider()),
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bridgewhat Academy',
      home: const InitialPage(),
      theme: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor: MaterialStateProperty.all(
                  Colors.grey.withOpacity(0.5)
              )
          )
      ),
    );
  }
}