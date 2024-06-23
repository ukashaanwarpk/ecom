import 'package:ecom/utils/extension.dart';
import 'package:ecom/view/widgets/cart_items.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class CartScreen extends StatelessWidget {
  final Product product;
  const CartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Cart'),
            CartItems(product: product,)

          ],
        ),
      ),
    );
  }
}
