import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? productId;
  String? title;
  String? description;
  String? image;
  int? categoryId;
  double? price;

  Product(
      {required this.productId,
      required this.title,
      required this.price,
      this.description,
      this.image,
      this.categoryId});

  static Product empty() => Product(
        productId: '',
        title: '',
        price: 0,
      );
  toJson() {
    return {
      'ProductId': productId,
      'Title': title,
      'Price': price,
      'Images': image,
      'CategoryId': categoryId,
      'Description': description,
    };
  }

  // Map json oriented document snapshot from firebase model

  factory Product.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return Product.empty();
    final data = document.data()!;
    return Product(
      productId: document.id,
      title: data['Title'],
      price: data['Price'],
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      image: data['Images'],
    );
  }
}
