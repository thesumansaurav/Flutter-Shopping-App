
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../widgets/themes.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creameColor,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make()
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal()
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
 
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
     final cart = CartModel();

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${cart.totalPrice}".text.xl4.color(MyTheme.darkBluishColor).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: (){}, 
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor)),
            child: "Buy".text.color(Colors.white).make()
            ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(onPressed: (){}, 
        icon: const Icon(Icons.remove_circle_outline_outlined)
        ),
        title: _cart.items[index].name.text.make()
      ),
    );
  }
}