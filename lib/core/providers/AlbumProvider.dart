import 'package:flutter/material.dart';
import 'package:hello_world/core/models/AlbumModel.dart';
import 'package:hello_world/core/services/AlbumService.dart';

class AlbumProvider extends ChangeNotifier {
  List<AlbumModel> _albumList;
  List<AlbumModel> get albumList => _albumList;

  AlbumService albumService = AlbumService();

  void getAlbum() async {
    _albumList = await albumService.fetchAlbum();
    notifyListeners();
  }
}
