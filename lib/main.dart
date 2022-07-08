import 'dart:io';

import 'package:coffeelips/bloc/products_bloc.dart';
import 'package:coffeelips/ui/pages/OnBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/blocs.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PageBloc()),
            BlocProvider(create: (context) => UserBloc()),
            BlocProvider(create: (context) => ThemeBloc()),
            BlocProvider(
                create: (context) => ProductsBloc()..add(FetchProducts())),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                    theme: themeState.themeData,
                    debugShowCheckedModeBanner: false,
                    home: OnBoardingScreen(),
                    // color: Colors.white,
                  ))),
    );
  }
}
