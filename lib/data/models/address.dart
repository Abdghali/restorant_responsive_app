class Address {
  late String country;
  late String city;
  late String street;
  late String postCode;

  Address(
      {this.country = ' ',
      this.city = ' ',
      this.street = ' ',
      this.postCode = ' '});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'] ?? '';
    city = json['city'] ?? '';
    street = json['street'] ?? '';
    postCode = json['post_code'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['street'] = this.street;
    data['post_code'] = this.postCode;
    return data;
  }
}
