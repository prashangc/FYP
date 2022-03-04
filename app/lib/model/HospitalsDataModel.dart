class HospitalDataModel {
  int? id;
  String? hospitalName;
  String? hospitalImage;
  String? address;
  String? hospitalDetail;
  bool? favourite;
  int? totalFavourite;

  HospitalDataModel(
      {this.id,
      this.hospitalName,
      this.hospitalImage,
      this.address,
      this.hospitalDetail,
      this.favourite,
      this.totalFavourite});

  HospitalDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalName = json['hospital_name'];
    hospitalImage = json['hospital_image'];
    address = json['address'];
    hospitalDetail = json['hospital_detail'];
    favourite = json['favourite'];
    totalFavourite = json['totalFavourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['hospital_name'] = hospitalName;
    data['hospital_image'] = hospitalImage;
    data['address'] = address;
    data['hospital_detail'] = hospitalDetail;
    data['favourite'] = favourite;
    data['totalFavourite'] = totalFavourite;
    return data;
  }
}
