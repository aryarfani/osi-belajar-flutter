import 'package:flutter/material.dart';
import 'package:hello_world/core/providers/AlbumProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlbumProvider>(
      create: (context) => AlbumProvider(),
      child: Consumer<AlbumProvider>(
        builder: (context, albumProv, _) {
          if (albumProv.albumList == null) {
            albumProv.getAlbum();
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Bazinga'),
            ),
            body: Container(
              child: ListView.builder(
                  itemCount: albumProv.albumList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image(
                          image: NetworkImage(albumProv.albumList[index].image),
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        title: Text(albumProv.albumList[index].title),
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
