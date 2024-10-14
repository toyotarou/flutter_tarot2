import '../extensions/extensions.dart';

class TodayTarotModel {
  TodayTarotModel({
    required this.id,
    required this.name,
    required this.prof1,
    required this.prof2,
    required this.justReverse,
    required this.image,
    required this.word,
    required this.msg,
    required this.msg2,
    required this.msg3,
  });

  factory TodayTarotModel.fromJson(Map<String, dynamic> json) =>
      TodayTarotModel(
        id: json['id'].toString().toInt(),
        name: json['name'].toString(),
        prof1: json['prof1'].toString(),
        prof2: json['prof2'].toString(),
        justReverse: json['just_reverse'].toString(),
        image: json['image'].toString(),
        word: json['word'].toString(),
        msg: json['msg'].toString(),
        msg2: json['msg2'].toString(),
        msg3: json['msg3'].toString(),
      );
  int id;
  String name;
  String prof1;
  String prof2;
  String justReverse;
  String image;
  String word;
  String msg;
  String msg2;
  String msg3;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'prof1': prof1,
        'prof2': prof2,
        'just_reverse': justReverse,
        'image': image,
        'word': word,
        'msg': msg,
        'msg2': msg2,
        'msg3': msg3,
      };
}
