import 'package:access_api/models/cart.dart';
import 'package:access_api/services/api_service.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
      ),
      body: FutureBuilder<Cart>(
        future: ApiService().getCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(snapshot.data!.carts[index].id.toString()),
                  title: Text(
                      snapshot.data!.carts[index].totalProducts.toString()),
                  subtitle: Text(
                      snapshot.data!.carts[index].totalQuantity.toString()),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
