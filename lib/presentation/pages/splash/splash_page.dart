import 'package:clean_arch_moovz/di.dart';
import 'package:clean_arch_moovz/presentation/navigation/routes.dart';
import 'package:clean_arch_moovz/presentation/pages/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashViewModel viewModel = getIt<SplashViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.start(() {
      if (!mounted) return;
      context.go(AppRoutes.home.path);
    });
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash.gif',
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}
