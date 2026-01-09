import 'package:clean_arch_moovz/core/colors.dart';
import 'package:clean_arch_moovz/di.dart';
import 'package:clean_arch_moovz/presentation/navigation/router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clean Arch Moovz',
      routerConfig: appRouter,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'NjNaruto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.orange,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      theme: ThemeData(
        fontFamily: 'NjNaruto',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orange),
        useMaterial3: true,
      ),
    );
  }
}
