import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/product_model.dart';

class ListProductPage extends StatelessWidget {
  ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future : http.get(Uri.parse("https://fakestoreapi.com/products/")),
        builder:(_,snapshot){
          if(snapshot.hasData && snapshot.data !=null){
            String body = snapshot.data!.body;
            List<dynamic> lsProducts= (jsonDecode(body) as List)
                .map((e) => Product.fromJson(e))
                .toList() as List;
            return Scaffold(
                appBar: AppBar(
                    title: const Text("ListProduct"),
                    actions: [
                      IconButton(
                          onPressed: ()=> context.go('/cart'),
                          icon: const Icon(Icons.shopping_cart_checkout_outlined))
                    ],),
                body:ListView.builder(
                    itemCount: lsProducts.length,
                    itemBuilder: (context, index){
                      final Product product = lsProducts[index];
                      return InkWell(
                        onTap: () => context.go('/detail',extra: product),
                        child: ListTile(
                          title: Text(product.title),
                          subtitle: Text("${product.price} €",
                              style: Theme.of(context).textTheme.titleLarge),
                          leading: Hero(
                            tag: product.id,
                            child: Image.network(product.image,
                                width: 80, height: 80),
                          ),
                          trailing: TextButton(
                            onPressed: () => context.read<CartModel>().addProduct(product),
                            child: Text("add"),
                          ),
                        ),
                      );
                    }
                )
            );
          }
          return const CircularProgressIndicator();
        }
    );

  }
}


