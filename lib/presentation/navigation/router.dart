import 'package:clean_arch_moovz/presentation/navigation/routes.dart';
import 'package:clean_arch_moovz/presentation/pages/home/home_page.dart';
import 'package:clean_arch_moovz/presentation/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash.path,
  routes: [
    GoRoute(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
