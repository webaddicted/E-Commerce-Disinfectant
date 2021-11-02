/// Author : Deepak sharma(webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class UserIno {
  String customerId = '';
  String name = '';
  String email = '';
  String dob = '';
  String mobile = '';
  String address = '';
  String customerImage = '';
  String cityId = '';
  String centerId = '';


  UserIno(
      this.customerId,
      this.name,
      this.email,
      this.dob,
      this.mobile,
      this.address,
      this.customerImage,
      this.cityId,
      this.centerId);

  UserIno.fromJson(Map<String, dynamic> json) {
    customerId = json["customer_id"];
    name = json["name"];
    email = json["email"];
    dob = json["dob"];
    mobile = json["mobile"];
    address = json["address"];
    customerImage = json["customer_image"];
    cityId = json["city_id"];
    centerId = json["center_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["customer_id"] = customerId;
    map["name"] = name;
    map["email"] = email;
    map["dob"] = dob;
    map["mobile"] = mobile;
    map["address"] = address;
    map["customer_image"] = customerImage;
    map["city_id"] = cityId;
    map["center_id"] = centerId;
    return map;
  }
}
