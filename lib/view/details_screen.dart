import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/model/product_model.dart';
import 'package:ecom/utils/extension.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('details Screen'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            width: context.width,
            height: context.height * 0.40,
            imageUrl: product.image.toString(),
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            margin: EdgeInsets.only(top: context.height * 0.35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                const Text(
                  'Description:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  product.description.toString(),
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price : \$${product.price}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: context.width * 0.20,
                      child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 247, 247, 247),
                                content: Text(
                                  "Item Added!",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: context.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen(product: product,)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
