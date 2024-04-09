import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valencia_ex6/models/item.dart';
import 'package:valencia_ex6/provider/cart_provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Checkout")),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Text("Item Details"),
          getItems(context),
        ])));
  }

  Widget getItems(BuildContext context) {
    List<Item> products = context.watch<ShoppingCart>().cart;
    // String productname = "";
    return products.isEmpty
        ? const Text('No Items to checkout!')
        : Expanded(
            child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(products[index].name),
                    trailing: Text("${products[index].price}"),
                  );
                },
              )),
              computeCost(),
              Flexible(
                  child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<ShoppingCart>().resetTotal = 0;
                            context.read<ShoppingCart>().removeAll();
                            Navigator.pushNamed(context, "/");
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Payment Successful!"),
                              duration: Duration(seconds: 1, milliseconds: 100),
                            ));
                          },
                          child: const Text("Pay Now!"))))
            ],
          ));
  }

  Widget computeCost() {
    return Consumer<ShoppingCart>(builder: (context, cart, child) {
      return Text("Total cost to pay: ${cart.cartTotal}");
    });
  }
}
