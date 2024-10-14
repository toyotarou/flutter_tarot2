import '../extensions/extensions.dart';

class RateModel {
  RateModel({required this.id, required this.rate});

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
      id: json['id'].toString().toInt(), rate: json['rate'].toString());
  int id;
  String rate;

  Map<String, dynamic> toJson() => <String, dynamic>{'id': id, 'rate': rate};
}
