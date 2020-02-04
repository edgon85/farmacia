import 'package:cloud_firestore/cloud_firestore.dart';

class ProductProvider {
  var firestore = Firestore.instance;

  // Obtener los Banners de promocion
  Future<List<String>> getBannerFuture() async {
    QuerySnapshot qn = await firestore.collection('banner').getDocuments();

    List<String> data = [];

    for(var i = 0; i < qn.documents.length; i++){
      data.add(qn.documents[i]['image']);
    }

   // print(data);
    return data;
  }

}
