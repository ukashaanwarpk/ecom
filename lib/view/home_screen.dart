import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/utils/dummy_data.dart';
import 'package:ecom/utils/extension.dart';
import 'package:ecom/view/details_screen.dart';
import 'package:ecom/view_model/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final provider = Provider.of<ProductsProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (val) {},
              decoration: InputDecoration(
                hintText: 'Search with name',
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200)),
              ),
            ),
            SizedBox(
              height: context.height * 0.05,
            ),
            Expanded(
              child: FutureBuilder(
                  future: provider.getProducts(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator(color: Colors.red,));
                    } else {
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            mainAxisExtent: context.height * 0.30,
                          ),
                          itemBuilder: (context, index) {
                            final product = snapshot.data![index];

                            return GestureDetector(
                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product: product))),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                      child: CachedNetworkImage(
                                        imageUrl: product.image.toString(),
                                        fit: BoxFit.cover,
                                        width: context.width,
                                        height: context.height * 0.15,
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            product.title.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: context.height * 0.03,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('\$${product.price}'),
                                              Container(
                                                decoration:  BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: Colors.blue,
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
