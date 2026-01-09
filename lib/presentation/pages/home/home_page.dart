import 'package:clean_arch_moovz/core/colors.dart';
import 'package:clean_arch_moovz/di.dart';
import 'package:clean_arch_moovz/presentation/pages/home/viewModels/akatsuki_view_model.dart';
import 'package:clean_arch_moovz/presentation/pages/home/viewModels/characters_view_model.dart';
import 'package:clean_arch_moovz/presentation/pages/home/views/akatsuki_view.dart';
import 'package:clean_arch_moovz/presentation/pages/home/views/characters_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<CharacterViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<AkatsukiViewModel>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Naruto Characters App'),
          centerTitle: true,
          backgroundColor: AppColors.orange,
          titleTextStyle: TextStyle(
            fontFamily: 'NjNaruto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            CharactersView(),
            SizedBox(height: 16),
            AkatsukiView(),
          ],
        ),
      ),
    );
  }
}