import 'package:dio/dio.dart';
import 'package:hello_world/core/models/AlbumModel.dart';

class AlbumService {
  Dio _dio() {
    final options = BaseOptions(
      receiveTimeout: 3000,
      baseUrl: 'https://api.jikan.moe/v3',
      contentType: "application/json",
    );
    var dio = Dio(options);

    return dio;
  }

  Dio get dio => _dio();

  Future<List<AlbumModel>> fetchAlbum() async {
    List<AlbumModel> albumList = [];
    try {
      var res = await dio.get('/search/anime?q=Fate/Zero&page=1');
      if (res.statusCode == 200) {
        res.data['results'].forEach((album) {
          albumList.add(AlbumModel.fromJson(album));
        });
      }
    } catch (e) {
      print(e);
    }
    return albumList;
  }
}
