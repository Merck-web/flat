import 'package:flutter/material.dart';

import '../api/CatApi.dart';

class GalleryData extends ChangeNotifier {
  List<String> cats = [];

  Future<List<String>>? images;

  Future<void> getImages() async {
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

    cats = images;
    notifyListeners();
  }
}