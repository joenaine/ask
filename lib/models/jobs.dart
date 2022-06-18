class JobsMobel {
  String? title;
  String? profobl;
  String? price;
  String? company;
  String? location;
  String? experience;
  String? time;
  String? education;

  JobsMobel(
      {this.title,
      this.profobl,
      this.price,
      this.company,
      this.location,
      this.experience,
      this.time,
      this.education});

  JobsMobel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    profobl = json['profobl'];
    price = json[price];
    company = json['company'];
    location = json['location'];
    experience = json['experience'];
    time = json['time'];
    education = json[education];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['profobl'] = profobl;
    data['price'] = price;
    data['company'] = company;
    data['location'] = location;
    data['experience'] = experience;
    data['time'] = time;
    data['education'] = education;
    return data;
  }
}
