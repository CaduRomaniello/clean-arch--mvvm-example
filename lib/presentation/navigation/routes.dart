enum AppRoutes {
  splash('/'),
  home('/home'),
  login('/character_info');

  const AppRoutes(this.path);
  final String path;

  String get name => toString().split('.').last;
}
