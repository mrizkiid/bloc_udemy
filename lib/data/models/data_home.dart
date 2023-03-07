class DataHomeModel {
  String? fullname;
  String? profile;
  String? email;
  String? masakan;
  String? gambarMasakan;
  String? porsi;
  String? kesulitan;

  DataHomeModel({this.fullname, this.profile, this.email, this.masakan, this.gambarMasakan, this.porsi, this.kesulitan});

  DataHomeModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    profile = json['profile'];
    email = json['email'];
    masakan = json['masakan'];
    gambarMasakan = json['gambar_masakan'];
    porsi = json['porsi'];
    kesulitan = json['kesulitan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['profile'] = this.profile;
    data['email'] = this.email;
    data['masakan'] = this.masakan;
    data['gambar_masakan'] = this.gambarMasakan;
    data['porsi'] = this.porsi;
    data['kesulitan'] = this.kesulitan;
    return data;
  }
}
