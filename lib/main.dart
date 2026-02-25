import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const PronoApp());
}

class PronoApp extends StatelessWidget {
  const PronoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prono Awards',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
