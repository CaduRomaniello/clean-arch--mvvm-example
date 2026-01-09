import 'package:clean_arch_moovz/core/utils.dart';
import 'package:clean_arch_moovz/domain/characters/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.id,
    required super.name,
    required super.images,
    required super.natureType,
    super.personal,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: normalizeString(json['name'] as String),
      images: normalizeStringList(List<String>.from(json['images'] ?? [])),
      natureType: normalizeStringList(List<String>.from(json['natureType'] ?? [])),
      personal: json['personal'] != null ? PersonalModel.fromJson(json['personal']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'natureType': natureType,
      'personal': personal != null ? (personal as PersonalModel).toJson() : null,
    };
  }
}

class PersonalModel extends PersonalEntity {
  PersonalModel({
    super.birthdate,
    super.sex,
    required super.kekkeiGenkai,
    required super.classification,
    required super.occupation,
    required super.affiliation,
    super.clan,
  });

  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    List<String> parseStringOrList(dynamic value) {
      if (value == null) {
        return [];
      } else if (value is String) {
        return [normalizeString(value)];
      } else if (value is List) {
        return normalizeStringList(List<String>.from(value));
      } else {
        return [];
      }
    }

    return PersonalModel(
      birthdate: normalizeNullableString(json['birthdate'] as String?),
      sex: normalizeNullableString(json['sex'] as String?),
      kekkeiGenkai: parseStringOrList(json['kekkeiGenkai']),
      classification: parseStringOrList(json['classification']),
      occupation: parseStringOrList(json['occupation']),
      affiliation: parseStringOrList(json['affiliation']),
      clan: parseStringOrList(json['clan']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'birthdate': birthdate,
      'sex': sex,
      'kekkeiGenkai': kekkeiGenkai,
      'classification': classification,
      'occupation': occupation,
      'affiliation': affiliation,
      'clan': clan,
    };
  }
}

