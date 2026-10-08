import 'package:hive/hive.dart';

part 'player_data.g.dart';

@HiveType(typeId: 0)
class PlayerData extends HiveObject {
  @HiveField(0)
  final String familyName;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final DateTime birthDate;

  @HiveField(3)
  final String fatherName;

  @HiveField(4)
  final String fatherPhoneNumber;

  @HiveField(5)
  final String playerNumber;

  PlayerData(
    this.familyName,
    this.name,
    this.birthDate,
    this.fatherName,
    this.fatherPhoneNumber,
    this.playerNumber,
  );
}

final Box<PlayerData> mybox = Hive.box<PlayerData>('players');
