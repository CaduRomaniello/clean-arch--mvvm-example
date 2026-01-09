import 'package:clean_arch_moovz/domain/akatsuki/entities/akatsuki_entity.dart';

abstract class AkatsukiRepository {
  Future<List<AkatsukiEntity>> getAkatsukiMembers();
}