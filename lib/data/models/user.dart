class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<DataUser>? data;
  Support? support;

  UserModel({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});

  UserModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <DataUser>[];
      json['data'].forEach((v) {
        data!.add(new DataUser.fromJson(v));
      });
    }
    support = json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataJson = new Map<String, dynamic>();
    dataJson['page'] = this.page;
    dataJson['per_page'] = this.perPage;
    dataJson['total'] = this.total;
    dataJson['total_pages'] = this.totalPages;
    if (this.data != null) {
      dataJson['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      dataJson['support'] = this.support!.toJson();
    }
    return dataJson;
  }
}

class DataUser {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  DataUser({this.id, this.email, this.firstName, this.lastName, this.avatar});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
