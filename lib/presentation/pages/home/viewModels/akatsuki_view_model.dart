import 'package:clean_arch_moovz/core/enums.dart';
import 'package:clean_arch_moovz/domain/akatsuki/entities/akatsuki_entity.dart';
import 'package:clean_arch_moovz/domain/akatsuki/usecases/get_akatsuki_members_usecase.dart';
import 'package:flutter/foundation.dart';

class AkatsukiViewModel extends ChangeNotifier {
  final GetAkatsukiMembersUsecase _getAkatsukiMembersUsecase;

  AkatsukiViewModel(this._getAkatsukiMembersUsecase);

  List<AkatsukiEntity> _members = [];
  List<AkatsukiEntity> get members => _members;

  ViewModelState _state = ViewModelState.loading;
  ViewModelState get state => _state;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadMembers() async {
    _state = ViewModelState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _members = await _getAkatsukiMembersUsecase();
      _state = ViewModelState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewModelState.error;
    }
    notifyListeners();
  }
}