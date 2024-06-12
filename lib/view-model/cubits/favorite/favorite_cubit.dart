import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:waghetak_app/main.dart';
import 'package:waghetak_app/view-model/hive/favorite.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
 late Box<Favorite> favoriteBox;

  FavoriteCubit() : super(FavoriteInitial()) {
    favoriteBox = Hive.box<Favorite>('favorites');
    loadFavorites();
  }

  void loadFavorites() async {
    emit(FavoriteLoading());
    final favorites = favoriteBox.values.toList();
    emit(FavoriteLoaded(favorites));
  }

  void toggleFavorite(String id) async {
    if (favoriteBox.containsKey(id)) {
      favoriteBox.delete(id);
    } else {
      favoriteBox.put(id, Favorite(id));
    }
    loadFavorites();
  }

  Future<void> secureStore(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> secureRetrieve(String key) async {
    return await secureStorage.read(key: key);
  }
}
