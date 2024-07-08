import 'package:flutter/material.dart';
import 'package:silo_barbing_app/features/haircut_list/ui/haircuts_page.dart';
import 'package:silo_barbing_app/features/home/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HaircutsPage(),
    );
  }
}
