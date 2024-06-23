import 'package:ecom/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class CartItems extends StatelessWidget {
  final Product product;
  const CartItems({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: context.height * 0.13,
            width: context.width * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Image.network(
                height: 70,
                width: 70,
                product.image.toString(),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
              width: context.width * 0.22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.toString(),
                    style: TextStyle(
                      fontSize: context.width * 0.018,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.005,
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: context.width * 0.020,
                    ),
                  ),
                  SizedBox(
                    height: context.width * 0.015,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      const Text('2'),
                       SizedBox(
                        width: context.width*0.015,
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )),
          GestureDetector(
            onTap: () {

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color.fromARGB(255, 247, 247, 247),
                  content: Text(
                    "Item removed!",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.redAccent.withOpacity(0.07),
              radius: 18,
              child: const Icon(
                Icons.delete,
                color: Colors.redAccent,
                size: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
