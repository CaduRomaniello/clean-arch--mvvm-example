import 'package:clean_arch_moovz/core/utils.dart';
import 'package:clean_arch_moovz/domain/akatsuki/entities/akatsuki_entity.dart';

class AkatsukiModel extends AkatsukiEntity {
  AkatsukiModel({
    required super.id,
    required super.name,
    super.images,
    super.natureType,
    super.debut,
  });

  factory AkatsukiModel.fromJson(Map<String, dynamic> json) {
    return AkatsukiModel(
      id: json['id'] as int,
      name: normalizeString(json['name'] as String),
      images: json['images'] != null ? normalizeNullableStringList(List<String>.from(json['images'])) : null,
      natureType: json['natureType'] != null ? normalizeNullableStringList(List<String>.from(json['natureType'])) : null,
      debut: json['debut'] != null ? DebutModel.fromJson(json['debut']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'natureType': natureType,
      'debut': debut != null ? (debut as DebutModel).toJson() : null,
    };
  }
}

class DebutModel extends DebutEntity {
  DebutModel({
    super.manga,
    super.anime,
    super.novel,
    super.movie,
    super.game,
    super.ova,
    super.appearsIn,
  });

  factory DebutModel.fromJson(Map<String, dynamic> json) {
    return DebutModel(
      manga: normalizeNullableString(json['manga'] as String?),
      anime: normalizeNullableString(json['anime'] as String?),
      novel: normalizeNullableString(json['novel'] as String?),
      movie: normalizeNullableString(json['movie'] as String?),
      game: normalizeNullableString(json['game'] as String?),
      ova: normalizeNullableString(json['ova'] as String?),
      appearsIn: normalizeNullableString(json['appearsIn'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'manga': manga,
      'anime': anime,
      'novel': novel,
      'movie': movie,
      'game': game,
      'ova': ova,
      'appearsIn': appearsIn,
    };
  }
}
