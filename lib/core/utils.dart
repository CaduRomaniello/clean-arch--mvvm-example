String normalizeString(String input) {
  const withDiacritics = 'àáâãäåæçèéêëìíîïðñòóôõöøùúûüýÿÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝōŌūŪ';
  const withoutDiacritics = 'aaaaaaaceeeeiiiidnooooooouuuuyyAAAAAAACEEEEIIIIDNOOOOOOUUUUYoOuU';
  
  String result = input;
  for (int i = 0; i < withDiacritics.length; i++) {
    result = result.replaceAll(withDiacritics[i], withoutDiacritics[i]);
  }
  return result;
}

String? normalizeNullableString(String? input) {
  if (input == null) return null;
  return normalizeString(input);
}

List<String> normalizeStringList(List<String> list) {
  return list.map((s) => normalizeString(s)).toList();
}

List<String>? normalizeNullableStringList(List<String>? list) {
  if (list == null) return null;
  return list.map((s) => normalizeString(s)).toList();
}
