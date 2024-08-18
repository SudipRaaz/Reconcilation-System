import 'package:flutter/material.dart';
import 'package:ndpc_gokyo/presentation/Reconcilation/reconcilation_page.dart';
import 'package:ndpc_gokyo/presentation/test/test.dart';
import 'package:ndpc_gokyo/routes/route_path.dart';

Map<String, Widget> sideBarMenuItems = {
  // "Dashboard",
  "Reconcile": const ReconcilationPage(),
  "Test Page": const TestPage(),
};
