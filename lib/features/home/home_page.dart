import 'package:flutter/material.dart';
import 'package:silo_barbing_app/features/haircut_list/ui/haircuts_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Haircuts List'),),
      // body: const HaircutsPage(),
    );
  }
}