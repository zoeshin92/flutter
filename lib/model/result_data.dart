import 'package:hive/hive.dart';

part 'result_data.g.dart';

@HiveType(typeId: 0)
class ResultData {
  @HiveField(0)
  late int win;

  @HiveField(1)
  late int lose;

  @HiveField(2)
  late int draw;

  ResultData();

}
