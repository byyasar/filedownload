class DersModel {
  String ders;

  DersModel({this.ders});

  DersModel.fromJson(Map<String, dynamic> json) {
    ders = json['ders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ders'] = this.ders;
    return data;
  }
}
