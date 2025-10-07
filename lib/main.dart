import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_try/Screens/api.dart';
import 'package:riverpod_try/Screens/family.dart';
// import 'package:riverpod_try/CRUD/home_screen.dart';
// import 'package:riverpod_try/Favourite/home.dart';
// import 'package:riverpod_try/Screens/home_screen.dart';
// import 'package:riverpod_try/Screens/simple_provider.dart';
// import 'package:riverpod_try/Screens/state_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) { 
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(139, 104, 58, 183),
          ),
        ),
        home: Family(),
      ),
    );
  }
}
