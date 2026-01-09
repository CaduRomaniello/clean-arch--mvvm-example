import 'package:clean_arch_moovz/core/enums.dart';
import 'package:clean_arch_moovz/domain/characters/entities/character_entity.dart';
import 'package:clean_arch_moovz/domain/characters/usecases/get_characters_page_usecase.dart';
import 'package:flutter/foundation.dart';

class CharacterViewModel extends ChangeNotifier {
  final GetCharactersPageUsecase _getCharactersUseCase;

  CharacterViewModel(this._getCharactersUseCase);

  List<CharacterEntity> _characters = [];
  List<CharacterEntity> get characters => _characters;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  ViewModelState _state = ViewModelState.loading;
  ViewModelState get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadCharacters({int page = 1}) async {
    _state = ViewModelState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _characters = await _getCharactersUseCase(pageNumber: page);
      _currentPage = page;
      _state = ViewModelState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewModelState.error;
    }
    notifyListeners();
  }

  Future<void> nextPage() async {
    await loadCharacters(page: _currentPage + 1);
  }

  Future<void> previousPage() async {
    if (_currentPage > 1) {
      await loadCharacters(page: _currentPage - 1);
    }
  }
}
