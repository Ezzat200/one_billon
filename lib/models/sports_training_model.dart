



class SportsTrainingModel
{
  String? url;
  String? text;
  String? description;
  String? uid;
  String? uploadTime;
  String? image;
  SportsTrainingModel({
    this.url='NULL',
    this.text='NULL',
    this.uid='NULL',
    this.uploadTime='NULL',
    this.image='NULL',
    this.description='NULL',
  });
  factory SportsTrainingModel.fromJson(Map<String, dynamic> json) => SportsTrainingModel(
    url: json["url"] ,
    text: json["text"] ,
    uid: json["uid"] ,
    uploadTime: json["uploadTime"] ,
    image: json["imageUrl"] ,
    description: json["description"] ,

  );

  Map<String, dynamic> toJson() => {
    "url": url ,
    "text": text ,
    "description": description ,
    "uid": uid ,
    "uploadTime": uploadTime ,
    "imageUrl": image ,
  };





}