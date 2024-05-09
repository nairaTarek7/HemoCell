class EventModel {
  String? nameOfEvent;
  String? imageOfEvent;
  String? details;
  int? target;
  int? fixedTarget;
  List? listOfDonations;
  List? usersId;

  EventModel({
    this.nameOfEvent,
    this.imageOfEvent,
    this.details,
    this.target,
    this.fixedTarget,
    this.listOfDonations,
    this.usersId,
  });

  EventModel.fromJson(Map<dynamic, dynamic> json) {
    nameOfEvent = json['nameOfEvent'];
    imageOfEvent = json['imageOfEvent'];
    details = json['details'];
    target = json['target'];
    fixedTarget = json['fixedTarget'];
    listOfDonations = json['listOfDonations'];
    usersId = json['usersId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'nameOfEvent': nameOfEvent,
      'imageOfEvent': imageOfEvent,
      'details': details,
      'target': target,
      'fixedTarget': fixedTarget,
      'listOfDonations': listOfDonations,
      'usersId': usersId,
    };
  }
}
