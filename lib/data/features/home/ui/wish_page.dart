import 'package:flutter/material.dart';
import 'package:flutter_bloc_cart_eg/data/items.dart';

class WishPage extends StatelessWidget {
  const WishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
          itemCount: wishItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  image: DecorationImage(
                      image: NetworkImage(wishItems[index].imageUrl),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(wishItems[index].name),
                        Text(wishItems[index].price.toString()),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_bag_outlined)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_outline_outlined))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
