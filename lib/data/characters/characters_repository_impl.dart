import 'dart:convert';

import 'package:clean_arch_moovz/core/constants.dart';
import 'package:clean_arch_moovz/data/characters/models/character_model.dart';
import 'package:clean_arch_moovz/domain/characters/characters_repository.dart';
import 'package:clean_arch_moovz/domain/characters/entities/character_entity.dart';
import 'package:http/http.dart' as http;

class CharactersRepositoryImpl implements CharactersRepository {
  final http.Client _client;

  CharactersRepositoryImpl(this._client);

  @override
  Future<List<CharacterEntity>> getCharactersPage(int pageNumber) async {
    final response = await _client.get(
      Uri.parse('$API_URL/characters?page=$pageNumber'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> charactersJson = data['characters'] ?? [];
      return charactersJson
          .map((json) => CharacterModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load characters: ${response.statusCode}');
    }
  }
}
