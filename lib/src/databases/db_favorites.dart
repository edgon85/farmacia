import 'dart:io';

import 'package:farm_app/src/models/favorites/favoriteModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PharmappDB {
  static Database _database;
  static final PharmappDB db = PharmappDB._();

  PharmappDB._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'FavoritesDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE favorites (productId TEXT PRIMARY KEY, userUid TEXT, name TEXT, image TEXT, detail TEXT)",
      );
    });
  }

  // Crear Registros en la base de datos
  addToFavorites(Favorites nuevoFav) async {
    final db = await database;
    final res = await db.insert('Favorites', nuevoFav.toJson());

    return res;
  }

  // obtener un registro de favoritos
  Future<Favorites> isFavoriteById(String productId, String userUid) async {
    final db = await database;
    final res = await db.query('Favorites',
        where: 'productId = ? and userUid=?', whereArgs: [productId, userUid]);

    // print(res.isNotEmpty);

    return res.isNotEmpty ? Favorites.fromJson(res.first) : null;
  }

  // obtener todos los favoritos
  Future<List<Favorites>> getAllFavorites() async {
    final db = await database;
    final res = await db.query('Favorites');

    List<Favorites> list =
        res.isNotEmpty ? res.map((c) => Favorites.fromJson(c)).toList() : [];

    return list;
  }

  //Eliminar un registro de favoritos
  Future<int> deleteOneFav(String productId, String userUid) async {
    final db = await database;
    final res = await db.delete('Favorites',
        where: 'productId = ? and userUid=?', whereArgs: [productId, userUid]);

    return res;
  }

  //eliminar todos los registros de favoritos
  Future<int> deleteAllFavs() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Favorites');

    return res;
  }
}
