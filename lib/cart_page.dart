import 'package:epsi_shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartModel listProduct = context.watch<CartModel>();
    
    return Scaffold(
      appBar: AppBar(title: const Text("Panier EpsiShop")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Votre panier contient ${context.watch<CartModel>().getCount()} élément",
                style: Theme.of(context).textTheme.headline6,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: context.watch<CartModel>().getCount(),
                    itemBuilder: (context, index) => ListTile(
                      leading :Image.network(listProduct.getProducts()[index].image,
                        width: 80,height:80 ,),
                      title :Text(listProduct.getProducts()[index].nom),
                      trailing: IconButton(
                        onPressed: () {
                          listProduct.remove(listProduct.getProducts()[index]);
                        },
                        icon: const Icon(Icons.delete),
                      )
                  ),
                ),
              ),
              const Spacer(),
              Text("Votre panier total est de : ${context.watch<CartModel>().getTotalPrice()}",
                style: Theme.of(context).textTheme.headline6,
              )

            ],
          ),
        ),
      ),
    );
  }
}