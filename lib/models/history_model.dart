import '../extensions/extensions.dart';

class HistoryModel {
  HistoryModel({
    required this.year,
    required this.month,
    required this.day,
    required this.id,
    required this.reverse,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        year: json['year'].toString(),
        month: json['month'].toString(),
        day: json['day'].toString(),
        id: json['id'].toString().toInt(),
        reverse: json['reverse'].toString(),
      );
  String year;
  String month;
  String day;
  int id;
  String reverse;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'year': year,
        'month': month,
        'day': day,
        'id': id,
        'reverse': reverse,
      };
}
