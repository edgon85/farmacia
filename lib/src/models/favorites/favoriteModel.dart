import 'package:farm_app/src/databases/db_favorites.dart';

class FavoriteModel {
  getFavByPruductAndUser(String productId, String userUid) async {
    var data = await FavoritesDB.db.isFavoriteById(productId, userUid);
    return data;
  }

  void addToFavorite(Favorites favorites) async {
    //final favorites = new Favorites();

    await FavoritesDB.db.addToFavorites(favorites);
    // notifyListeners();
  }
  /*  void addToFavorite(String productId, String userId) async {
    final favorites = new Favorites(productId: productId, userUid: userId);

    await FavoritesDB.db.addToFavorites(favorites);
    // notifyListeners();
  } */

  void removeToFavorite(String productId, String userUid) async {
    await FavoritesDB.db.deleteOneFav(productId, userUid);
    //  notifyListeners();
  }
}
