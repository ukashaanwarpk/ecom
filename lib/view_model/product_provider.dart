import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/model/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductsProvider extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();
      return snapshot.docs
          .map((product) => Product.fromSnapshot(product))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('The error in getProduct');
      }
      rethrow;
    }
  }




  Future<void> uploadDummyData(List<Product> products)async{

    try{
      for(var product in products){
        await _db.collection('Products').doc(product.productId).set(product.toJson());
      }
    }

    catch(e){
      if (kDebugMode) {
        print('The error in getProduct');
      }
    }
  }
}
