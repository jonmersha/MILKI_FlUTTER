import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/utils/routes.dart';

void main() {
  runApp(const MyDashboardApp());
}

class MyDashboardApp extends StatelessWidget {
  const MyDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Millki Dashboard',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      //home: const DashboardHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
