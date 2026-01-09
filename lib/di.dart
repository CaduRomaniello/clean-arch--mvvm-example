import 'package:clean_arch_moovz/data/akatsuki/akatsuki_repository_impl.dart';
import 'package:clean_arch_moovz/data/characters/characters_repository_impl.dart';
import 'package:clean_arch_moovz/domain/akatsuki/akatsuki_repository.dart';
import 'package:clean_arch_moovz/domain/akatsuki/usecases/get_akatsuki_members_usecase.dart';
import 'package:clean_arch_moovz/domain/characters/characters_repository.dart';
import 'package:clean_arch_moovz/domain/characters/usecases/get_characters_page_usecase.dart';
import 'package:clean_arch_moovz/presentation/pages/home/viewModels/akatsuki_view_model.dart';
import 'package:clean_arch_moovz/presentation/pages/home/viewModels/characters_view_model.dart';
import 'package:clean_arch_moovz/presentation/pages/splash/splash_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  _registerExternal();
  _registerRepositories();
  _registerUseCases();
  _registerViewModels();
}

void _registerExternal() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());
}

void _registerRepositories() {
  getIt.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<AkatsukiRepository>(
    () => AkatsukiRepositoryImpl(getIt()),
  );
}

void _registerUseCases() {
  getIt.registerFactory(() => GetCharactersPageUsecase(getIt()));
  getIt.registerFactory(() => GetAkatsukiMembersUsecase(getIt()));
}

void _registerViewModels() {
  getIt.registerFactory(() => SplashViewModel());
  getIt.registerFactory(() => CharacterViewModel(getIt()));
  getIt.registerFactory(() => AkatsukiViewModel(getIt()));
}