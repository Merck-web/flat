import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_app/api/CatApi.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Future<List<String>>? images;

  Future<List<String>> getImages() async {
    List<String> images = [];

    CatApi catApi = CatApi(count: 25);

    List<dynamic>? data = await catApi.getCatData();

    if (data != null) {
      for (var item in data) {
        if (item is Map<String, dynamic> && item.containsKey('url')) {
          images.add(item['url'] as String);
        }
      }
    }

    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: images,
        builder: (BuildContext ctx, AsyncSnapshot<List<String>> snapshot) {

          switch(snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text('Произошла ошибка'));
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                    ),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Image.network(snapshot.data![index], fit: BoxFit.cover,);
                    },
                  ),
                ),
              );
          };

        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    images = getImages();
  }
}