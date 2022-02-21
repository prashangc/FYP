import 'package:app/screens/HospitalDetailsScreen.dart';
import 'package:app/screens/HospitalsListScreen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/LoginAndSignUp_screen.dart';
import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage("usertoken");

    return ChangeNotifierProvider(
      create: (ctx) => DetailsState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Doctor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
            future: storage.ready,
            builder: (context, snapshop) {
              if (snapshop.data == null) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (storage.getItem('token') == null) {
                return const LoginAndSignUpScreen();
              }
              return const HomeScreen();
            }),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          LoginAndSignUpScreen.routeName: (ctx) => const LoginAndSignUpScreen(),
          HospitalsListScreen.routeName: (ctx) => const HospitalsListScreen(),
          HospitalDetailsScreen.routeName: (ctx) =>
              const HospitalDetailsScreen(),
        },
      ),
    );
  }
}
