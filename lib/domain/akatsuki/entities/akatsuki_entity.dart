class AkatsukiEntity {
  final int id;
  final String name;
  final List<String>? images;
  final List<String>? natureType;
  final DebutEntity? debut;

  AkatsukiEntity({
    required this.id,
    required this.name,
    this.images,
    this.natureType,
    this.debut,
  });
}

class DebutEntity {
  final String? manga;
  final String? anime;
  final String? novel;
  final String? movie;
  final String? game;
  final String? ova;
  final String? appearsIn;

  DebutEntity({
    this.manga,
    this.anime,
    this.novel,
    this.movie,
    this.game,
    this.ova,
    this.appearsIn,
  });
}
