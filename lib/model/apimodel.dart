class Example {
  int? code;
  Meta? meta;
  List<Data>? data;

  Example({this.code, this.meta, this.data});

  Example.fromJson(Map<String, dynamic> json) {
    this.code = json["code"];
    this.meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    this.data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["code"] = this.code;
    if (this.meta != null) data["meta"] = this.meta?.toJson();
    if (this.data != null)
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  Data({this.id, this.name, this.email, this.gender, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.email = json["email"];
    this.gender = json["gender"];
    this.status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["email"] = this.email;
    data["gender"] = this.gender;
    data["status"] = this.status;
    return data;
  }
}

class Meta {
  Pagination? pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    this.pagination = json["pagination"] == null
        ? null
        : Pagination.fromJson(json["pagination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) data["pagination"] = this.pagination?.toJson();
    return data;
  }
}

class Pagination {
  int? total;
  int? pages;
  int? page;
  int? limit;

  Pagination({this.total, this.pages, this.page, this.limit});

  Pagination.fromJson(Map<String, dynamic> json) {
    this.total = json["total"];
    this.pages = json["pages"];
    this.page = json["page"];
    this.limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["total"] = this.total;
    data["pages"] = this.pages;
    data["page"] = this.page;
    data["limit"] = this.limit;
    return data;
  }
}
