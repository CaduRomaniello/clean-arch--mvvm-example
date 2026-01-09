
import 'package:clean_arch_moovz/domain/akatsuki/akatsuki_repository.dart';
import 'package:clean_arch_moovz/domain/akatsuki/entities/akatsuki_entity.dart';

class GetAkatsukiMembersUsecase {
  const GetAkatsukiMembersUsecase(this._repository);

  final AkatsukiRepository _repository;
  
  Future<List<AkatsukiEntity>> call() => _repository.getAkatsukiMembers();
}
