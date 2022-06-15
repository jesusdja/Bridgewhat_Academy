import 'package:academybw/main.dart';
import 'package:academybw/providers/auth_provider.dart';
import 'package:academybw/ui/home/splash_screen.dart';
import 'package:academybw/ui/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {

    var auth = Provider.of<AuthProvider>(context);

    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;

    switch (auth.authStatus) {
      case AuthStatus.splash:
        return const BasicSplash();
      case AuthStatus.login:
        return const RegisterPage();
      case AuthStatus.home:
        return const Scaffold(body: Center(child: Text('home'),),);
      default:
        return const BasicSplash();
    }
  }
}


