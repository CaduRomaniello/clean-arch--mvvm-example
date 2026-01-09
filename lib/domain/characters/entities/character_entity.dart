class CharacterEntity {
  final int id;
  final String name;
  final List<String>? images;
  final List<String>? natureType;
  final PersonalEntity? personal;

  CharacterEntity({
    required this.id,
    required this.name,
    this.images,
    this.natureType,
    this.personal,
  });
}

class PersonalEntity {
  final String? birthdate;
  final String? sex;
  final List<String>? kekkeiGenkai;
  final List<String>? classification;
  final List<String>? occupation;
  final List<String>? affiliation;
  final List<String>? clan;

  PersonalEntity({
    this.birthdate,
    this.sex,
    this.kekkeiGenkai,
    this.classification,
    this.occupation,
    this.affiliation,
    this.clan,
  });
}
