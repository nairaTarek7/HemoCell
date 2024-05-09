class PlaceModel {
  String? nameOfPlace;
  String? imageOfPlace;
  String? details;
  String? hoursOfWork;
  int? a1;
  int? a2;
  int? b1;
  int? b2;
  int? ab1;
  int? ab2;
  int? o1;
  int? o2;
  List? listOfNeedBlood;

  PlaceModel({
    this.nameOfPlace,
    this.imageOfPlace,
    this.details,
    this.hoursOfWork,
    this.a1,
    this.a2,
    this.b1,
    this.b2,
    this.ab1,
    this.ab2,
    this.o1,
    this.o2,
    this.listOfNeedBlood,
  });

  PlaceModel.fromJson(Map<dynamic, dynamic> json) {
    nameOfPlace = json['nameOfPlace'];
    imageOfPlace = json['imageOfPlace'];
    details = json['details'];
    hoursOfWork = json['hoursOfWork'];
    a1 = json['A+'];
    a2 = json['A-'];
    b1 = json['B+'];
    b2 = json['B-'];
    ab1 = json['AB+'];
    ab2 = json['AB-'];
    o1 = json['O+'];
    o2 = json['O-'];
    listOfNeedBlood = json['listOfNeedBlood'];
  }

  Map<String, dynamic> toMap() {
    return {
      'nameOfPlace': nameOfPlace,
      'imageOfPlace': imageOfPlace,
      'details': details,
      'hoursOfWork': hoursOfWork,
      'A+': a1,
      'A-': a2,
      'B+': b1,
      'B-': b2,
      'AB+': ab1,
      'AB-': ab2,
      'O+': o1,
      'O-': o2,
      'listOfNeedBlood': listOfNeedBlood,
    };
  }
}
