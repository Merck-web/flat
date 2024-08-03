import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../api/CatApi.dart';
part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  Future<void> getImages() async {
    emit(GalleryLoading());

    CatApi catApi = CatApi(count: 25);

    List<dynamic>? data = await catApi.getCatData();
    if (data != null) {
      List<String> images = [];
      for (var item in data) {
        if (item is Map<String, dynamic> && item.containsKey('url')) {
          images.add(item['url'] as String);
        }
      }
      emit(GalleryLoaded(images));
    } else {
      emit(GalleryError('Failed to fetch images'));
    }
  }
}
