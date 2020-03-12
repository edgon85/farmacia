import 'package:farm_app/src/common/gradient_widget.dart';
import 'package:farm_app/src/databases/db_favorites.dart';
import 'package:farm_app/src/models/auth/user_repository.dart';
import 'package:farm_app/src/models/favorites/favoriteModel.dart';
import 'package:farm_app/src/models/product/product_model.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatefulWidget {
  final bool hasData;
  final Size screenSize;
  FavButton({
    Key key,
    @required this.screenSize,
    @required this.hasData,
  }) : super(key: key);
  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  String isFavtext;
  bool isFavorite;
  IconData isFavIcon;
  Color isColorFav;

  @override
  void initState() {
    super.initState();

    if (widget.hasData) {
      isFavorite = true;
      isFavtext = 'Remover';
      isFavIcon = Icons.favorite;
      isColorFav = Colors.redAccent;
    } else {
      isFavorite = false;
      isFavtext = 'Agregar';
      isFavIcon = Icons.favorite_border;
      isColorFav = ColorApp.textIcons;
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context);
    final user = Provider.of<UserRepository>(context);

    final favorites = new Favorites(
      productId: product.productItem.id,
      userUid: user.user.uid,
      name: product.productItem.name,
      image: product.productItem.imagePath,
      detail: product.productItem.detail,
    );

    return Stack(
      children: <Widget>[
        Positioned(
            bottom: 0.0,
            left: 0.0,
            child: InkWell(
              onTap: () => _toggleFavorite(favorites),
              child: Container(
                width: widget.screenSize.width * 0.4,
                height: 75.0,
                decoration: BoxDecoration(
                    gradient: GradientDecoration().myLinearGradient(),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      isFavtext,
                      style: TextStyle(
                          color: ColorApp.textIcons,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      isFavIcon,
                      color: isColorFav,
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }

  // <===================================================> //
  // agrega y elimina favoritos
  // <===================================================> //
  void _toggleFavorite(Favorites favorites) {
    // FavoriteModel favoriteModel = new FavoriteModel();
    setState(() {
      if (isFavorite) {
        PharmappDB.db.deleteOneFav(favorites.productId, favorites.userUid);
        isFavorite = false;
        isFavtext = 'Agregar';
        isFavIcon = Icons.favorite_border;
        isColorFav = ColorApp.textIcons;
      } else {
        PharmappDB.db.addToFavorites(favorites);
        isFavorite = true;
        isFavtext = 'Remover';
        isFavIcon = Icons.favorite;
        isColorFav = Colors.redAccent;
      }
    });
  }
}
