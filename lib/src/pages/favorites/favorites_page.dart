import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_app/src/common/drawer.dart';
import 'package:farm_app/src/common/gradient_widget.dart';
import 'package:farm_app/src/databases/db_favorites.dart';
import 'package:farm_app/src/models/favorites/favoriteModel.dart';
import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final favoriteModel = new FavoriteModel();

    return Scaffold(
      drawer: DrawerMenu(),
      backgroundColor: ColorApp.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          _customAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              // _listaDeFavoritos(),

              FutureBuilder(
                  // future: favoriteModel.getAllFavorites(),
                  future: FavoritesDB.db.getAllFavorites(),
                  builder: (context, AsyncSnapshot<List<Favorites>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('...');
                      case ConnectionState.waiting:
                        return Text('Awaiting result...');
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          if (snapshot.data.length == 0) {
                            return Center(
                              child: Text('No hay favoritos'),
                            );
                          }
                          return _listaDeFavoritos(snapshot);
                        }
                    }
                  }),
              // _listaDeFavoritos()
            ]),
          )
        ],
      ),
    );
  }

  Widget _listaDeFavoritos(AsyncSnapshot<List<Favorites>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemList(context, snapshot, index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.transparent,
          height: 2.0,
        );
      },
    );
  }

  Widget _itemList(BuildContext context,
      AsyncSnapshot<List<Favorites>> snapshot, int index) {
    return Dismissible(
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      key: Key('fav'),
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: snapshot.data[index].image,
            placeholder: (contex, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(snapshot.data[index].name),
          subtitle: Text(snapshot.data[index].detail),
        ),
      ),
      onDismissed: (direction) {
        FavoritesDB.db.deleteOneFav(
            snapshot.data[index].productId, snapshot.data[index].userUid);

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Eliminado de mis favoritos'),
          ),
        );
      },
    );
  }

  Widget _customAppbar() {
    return SliverAppBar(
      elevation: 0.0,
      floating: false,
      pinned: true,
      centerTitle: true,
      title: Text('Favoritos'),
      flexibleSpace:
          Container(decoration: GradientDecoration().gradientDecoraion()),
    );
  }
}
