import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 0)
class Favorite {
  @HiveField(0)
  final String id;

  Favorite(this.id);
}
