import 'dart:convert';

import 'package:clean_arch_moovz/core/constants.dart';
import 'package:clean_arch_moovz/data/akatsuki/models/akatsuki_model.dart';
import 'package:clean_arch_moovz/domain/akatsuki/akatsuki_repository.dart';
import 'package:clean_arch_moovz/domain/akatsuki/entities/akatsuki_entity.dart';
import 'package:http/http.dart' as http;

class AkatsukiRepositoryImpl implements AkatsukiRepository {
  final http.Client _client;

  AkatsukiRepositoryImpl(this._client);

  @override
  Future<List<AkatsukiEntity>> getAkatsukiMembers() async {
    final response = await _client.get(
      Uri.parse('$API_URL/akatsuki?limit=50'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> akatsukiJson = data['akatsuki'] ?? [];
      return akatsukiJson
          .map((json) => AkatsukiModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load akatsuki members: ${response.statusCode}');
    }
  }
}
