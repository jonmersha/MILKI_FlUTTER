// lib/core/routes/app_routes.dart
import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/dashboard.dart';
import 'package:milkifoodcomplex/features/factory/factory_create_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String factoryCreate = '/factory-create';

  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const DashboardHome(),
    factoryCreate: (context) => const FactoryCreatePage(),
  };
}
