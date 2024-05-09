import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceModel2 {
  String? nameOfPlace;
  String? typeOfBlood;
  int? amountOfBags;
  Timestamp? timestampOfBegin;
  String? userId;
  bool? isDone;

  PlaceModel2({
    this.typeOfBlood,
        this.nameOfPlace,

    this.amountOfBags,
    this.isDone,
    this.timestampOfBegin,
    this.userId,
  });

  PlaceModel2.fromJson(Map<dynamic, dynamic> json) {
    typeOfBlood = json['typeOfBlood'];
        nameOfPlace = json['nameOfPlace'];

    amountOfBags = json['amountOfBags'];
    isDone = json['isDone'];
    userId = json['userId'];
    timestampOfBegin = json['timestampOfBegin'];

    isDone = json['isDone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'nameOfPlace': nameOfPlace,
      'typeOfBlood': typeOfBlood,
      'amountOfBags': amountOfBags,
      'isDone': isDone,
      'userId': userId,
      'timestampOfBegin': timestampOfBegin,
    
    };
  }
}
