class ImagineModel {
  ImagineModel({
      this.imageUrl, 
      this.message,});

  ImagineModel.fromJson(dynamic json) {
    imageUrl = json['imageUrl'];
    message = json['message'];
  }
  String? imageUrl;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = imageUrl;
    map['message'] = message;
    return map;
  }

}