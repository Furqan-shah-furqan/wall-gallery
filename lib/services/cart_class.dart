import 'dart:async';

import 'package:flutter/material.dart';
import 'pexel_service.dart';

class Cart with ChangeNotifier {
  // List<String> imageList = List.generate(
  //         50,
  //         (index) =>
  //             "assets/images/wallpaper_${(index + 1).toString().padLeft(3, '0')}.jpg")
  //     .reversed.toList();

  // Future<void> fetchImages({int start = 0, int count = 500}) async {
  //   final newImages = List.generate(
  //     count,
  //     (index) => 'https://picsum.photos/seed/${start + index}/400/600',
  //   );
  //   imageList.addAll(newImages);
  //   notifyListeners();
  // }
  List<String> wallCategory = [
    'cars',
    'nature',
    'white',
    'black',
    'coffee-background',
    'art',
    'cool-wallpaper',
    '4k-wallpaper',
    'dark',
    'sad',
    'love',
  ];
  List<String> wallCategoryName = [
    'Cars',
    'Nature',
    'White',
    'Black',
    'Coffee-background',
    'Art',
    'Cool-wallpaper',
    '4k-wallpaper',
    'Dark',
    'Sad',
    'Love',
  ];

  final _pexelsService = PexelsService();
  List<String> imageList = [];
  String selectedcategory = 'trending';
  bool isLoading = false;


   Future<void> fetchImages({required String query}) async {
    isLoading =true;
    notifyListeners();
    selectedcategory =query;
    imageList.clear();
    final newImages = await _pexelsService.fetchImages(query);
    imageList.addAll(newImages);

    isLoading =false;
    notifyListeners();
  }

}
