class cities {
  late int code;
  late bool status;
  late String  message;
  late List<Muns> muns;

  cities({required this.code,required this.status,required this.message,required this.muns});

  cities.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['muns'] != null) {
      muns = <Muns>[];
      json['muns'].forEach((v) {
        muns!.add(new Muns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.muns != null) {
      data['muns'] = this.muns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Muns {
  late int id;
  late String name;

  Muns({required this.id,required this.name});

  Muns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}