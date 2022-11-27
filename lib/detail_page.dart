import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'product_model.dart';
import 'checkbox.dart' as MyCheckbox;

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nom),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              //alignment: Alignment.center,
              height: 180,
              child: Hero(
                  tag: product.nom,
                  child: Image.network(product.image)
              ),
            ),
            Text(product.nom,style: Theme.of(context).textTheme.headline6,),
            RatingBar.builder(
              minRating: 0,
              itemCount: 5,
              initialRating: product.getRatingProduct(),
              allowHalfRating: true,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.greenAccent,
              ),
              onRatingUpdate: (double value) {
                product.rating = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Description",style: Theme.of(context).textTheme.headline5,),
            ),
            Text(product.description,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.displayPriceInEuro(),
                  style: Theme.of(context).textTheme.headline4
                      ?.copyWith(color: Colors.black),),
                  ElevatedButton(onPressed: (){}, child: Text("Acheter".toUpperCase()),)
              ],),

            ),
          ],
        ),
      ),
    );
  }
}