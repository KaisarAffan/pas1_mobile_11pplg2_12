class LigaEnglishModel {
  final String idTeam;
  final String strTeam;
  final String strLocation;
  final String strBadge;
  final String strDescription;
  bool isLiked;

  LigaEnglishModel(
      {required this.idTeam,
      required this.strTeam,
      required this.strLocation,
      required this.strBadge,
      required this.strDescription,
      this.isLiked = false});

  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strLocation': strLocation,
      'strBadge': strBadge,
      'strDescription': strDescription,
      'isLiked': isLiked ? 1 : 0,
    };
  }

  factory LigaEnglishModel.fromMap(Map<String, dynamic> map) {
    return LigaEnglishModel(
      idTeam: map['idTeam'],
      strTeam: map['strTeam'],
      strLocation: map['strLocation'],
      strBadge: map['strBadge'],
      strDescription: map['strDescription'],
      isLiked: map['isLiked'] == 1,
    );
  }

  factory LigaEnglishModel.fromJson(Map<String, dynamic> json) {
    return LigaEnglishModel(
      idTeam: json['idTeam'],
      strTeam: json['strTeam'],
      strLocation: json['strLocation'],
      strDescription: json['strDescriptionEN'],
      strBadge: json['strBadge'],
    );
  }
}
