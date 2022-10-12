import 'package:flutter/material.dart';
import 'package:flutter_sales/model/avis_model.dart';
import 'package:flutter_sales/model/product_model.dart';

class AvisPage extends StatelessWidget {
  final Product product;

  AvisPage(this.product,{Key? key}) : super(key: key);

  final List<Avis> lsAvis = [
    Avis(1,48,"Lorem ipsum dolor sit amet, consectetur", "https.//pacsum.photo/80/80","Lorem ipsum dolor sit amet, consectetur","Lorem ipsum dolor sit amet, consectetur"),
    Avis(2,8998,"Lorem ipsum dolor sit amet, consectetur", "https.//pacsum.photo/80/80","Lorem ipsum dolor sit amet, consectetur","Lorem ipsum dolor sit amet, consectetur"),
    Avis(3,448747789,"Lorem ipsum dolor sit amet, consectetur", "https.//pacsum.photo/80/80","Lorem ipsum dolor sit amet, consectetur","Lorem ipsum dolor sit amet, consectetur"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
          body:ListView.builder(
            itemCount: lsAvis.length,
            itemBuilder: (context, index){
              final Avis avis = lsAvis[index];
              return InkWell(
                child: ListTile(
                  title: Text(avis.titre),
                  subtitle: Text("${avis.username}",
                      style: Theme.of(context).textTheme.titleLarge),
                  leading: Hero(
                    tag: avis.id,
                    child: Image.network(avis.pp,
                        width: 80, height: 80),
                  ),
              )
                );
            }
    )
    );
  }
}
