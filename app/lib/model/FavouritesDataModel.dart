class FavouritesDataModel {
  int? id;
  bool? favourite;
  Hospital? hospital;

  FavouritesDataModel({this.id, this.favourite, this.hospital});

  FavouritesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    favourite = json['favourite'];
    hospital =
        json['hospital'] != null ? Hospital.fromJson(json['hospital']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['favourite'] = favourite;
    if (hospital != null) {
      data['hospital'] = hospital!.toJson();
    }
    return data;
  }
}

class Hospital {
  int? id;
  String? hospitalName;
  String? hospitalImage;
  String? hospitalDetail;

  Hospital(
      {this.id, this.hospitalName, this.hospitalImage, this.hospitalDetail});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalName = json['hospital_name'];
    hospitalImage = json['hospital_image'];
    hospitalDetail = json['hospital_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hospital_name'] = hospitalName;
    data['hospital_image'] = hospitalImage;
    data['hospital_detail'] = hospitalDetail;
    return data;
  }
}
