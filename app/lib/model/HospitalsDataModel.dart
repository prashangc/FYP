class HospitalsDataModel {
  int? id;
  String? hospitalName;
  String? hospitalImage;
  String? hospitalDetail;

  HospitalsDataModel(
      {this.id, this.hospitalName, this.hospitalImage, this.hospitalDetail});

  HospitalsDataModel.fromJson(Map<String, dynamic> json) {
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
