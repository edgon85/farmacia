import 'package:cloud_firestore/cloud_firestore.dart';

class ProductProvider {
  var firestore = Firestore.instance;

  // Obtener los Banners de promocion
  Future<List<String>> getBannerFuture() async {
    QuerySnapshot qn = await firestore.collection('banner').getDocuments();

    List<String> data = [];

    for (var i = 0; i < qn.documents.length; i++) {
      data.add(qn.documents[i]['image']);
    }
    // print(data);
    return data;
  }

  // obtener productos mas vendidos y destacados
  Stream<QuerySnapshot> getBestSeller(String queryId) {
    final qn = firestore
        .collection('products')
        .where(queryId, isEqualTo: true)
        .snapshots();
    return qn;
  }

  //obtener todas las categorias
  Stream<QuerySnapshot> getAllCategories() {
    final qn = firestore.collection('categories').snapshots();

    return qn;
  }

  // obtener productos por categoria
  Stream<QuerySnapshot> getProductByCategory(String _category) {
    final qn = firestore
        .collection('products')
        .where('category', isEqualTo: _category)
        .limit(5)
        .snapshots();

    return qn;
  }

  // obtener subcategorias
  Stream<QuerySnapshot> getAllSubcategories(String category) {
    final qn = firestore
        .collection('categories')
        .document(category)
        .collection('subcategories')
        .snapshots();

    return qn;
  }

  // obtener productos por subcategoria
  Stream<QuerySnapshot> getProductBySubategory(String subcategoryId) {
    final qn = firestore
        .collection('products')
        .where('subcategory', isEqualTo: subcategoryId)
        .snapshots();

    return qn;
  }
}
