class AlbumModel {
  int id;
  String title;
  String image;

  AlbumModel({this.id, this.title, this.image});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      title: json['title'],
      image: json['image_url'],
    );
  }
}
