class DonateByEventModel {
  List<Map<String, dynamic>>? donates;

  // String? nameOfTeam1;
  // String? nameOfTeam2;
  // int? scoreOfTeam1;
  // int? scoreOfTeam2;
  // String? logoOfTeam1;
  // String? logoOfTeam2;
  // String? nameOfReferee;
  // List? membersOfVotes;
  // String? rateFiveStar;
  // String? rateFourStar;
  // String? rateThreeStar;
  // String? rateTwoStar;
  // String? rateOneStar;
  // String? refereeId;
  // String? refereeImage;
  // Timestamp? timestampOfBegin;
  // Timestamp? timestampOfEnd;

  DonateByEventModel({
    this.donates,
    // this.nameOfTeam1,
    // this.nameOfTeam2,
    // this.scoreOfTeam1,
    // this.scoreOfTeam2,
    // this.logoOfTeam1,
    // this.logoOfTeam2,
    // this.nameOfReferee,
    // this.membersOfVotes,
    // this.rateFiveStar,
    // this.rateFourStar,
    // this.rateThreeStar,
    // this.rateTwoStar,
    // this.rateOneStar,
    // this.timestampOfBegin,
    // this.timestampOfEnd,
    // this.refereeId,
    // this.refereeImage,
  });

  DonateByEventModel.fromJson(Map<dynamic, dynamic> json) {
    donates = json['donates'];
    // nameOfTeam1 = json['nameOfTeam1'];
    // nameOfTeam2 = json['nameOfTeam2'];
    // scoreOfTeam1 = json['scoreOfTeam1'];
    // scoreOfTeam2 = json['scoreOfTeam2'];
    // logoOfTeam1 = json['logoOfTeam1'];
    // logoOfTeam2 = json['logoOfTeam2'];
    // nameOfReferee = json['nameOfReferee'];
    // membersOfVotes = json['membersOfVotes'];
    // rateFiveStar = json['rateFiveStar'];
    // rateFourStar = json['rateFourStar'];
    // rateThreeStar = json['rateThreeStar'];
    // rateTwoStar = json['rateTwoStar'];
    // rateOneStar = json['rateOneStar'];
    // timestampOfEnd = json['timestampOfEnd'];
    // timestampOfBegin = json['timestampOfBegin'];
    // refereeId = json['refereeId'];
    // refereeImage = json['refereeImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'donates': donates,
  
    };
  }
}
