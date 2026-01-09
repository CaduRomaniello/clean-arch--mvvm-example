import 'package:clean_arch_moovz/domain/characters/entities/character_entity.dart';

abstract class CharactersRepository {
  Future<List<CharacterEntity>> getCharactersPage(int pageNumber);
}