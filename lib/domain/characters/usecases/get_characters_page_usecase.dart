
import 'package:clean_arch_moovz/domain/characters/characters_repository.dart';
import 'package:clean_arch_moovz/domain/characters/entities/character_entity.dart';

class GetCharactersPageUsecase {
  const GetCharactersPageUsecase(this._repository);

  final CharactersRepository _repository;

  Future<List<CharacterEntity>> call({int pageNumber = 1}) => _repository.getCharactersPage(pageNumber);
}
