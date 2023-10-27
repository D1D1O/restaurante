import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/main_drawer.dart';
import 'package:panucci_ristorante/components/order_item.dart';
import 'package:panucci_ristorante/components/payment_method.dart';
import 'package:panucci_ristorante/components/payment_total.dart';

class CheckoutMenu extends StatelessWidget {
  const CheckoutMenu({super.key});

  final List items = pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Text(
                "Pedido",
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600,
                  //fontFamily: "Caveat",
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(childCount: items.length,
                  (context, index) {
                return OrderItem(
                    imageURI: items[index]["image"],
                    itemTitle: items[index]["name"],
                    itemPrice: items[index]["price"]);
              }),
            ),
            const SliverToBoxAdapter(
              child: Text(
                "Pagamento",
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600,
                  //fontFamily: "Caveat",
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: PaymentMethod(),
            ),
            const SliverToBoxAdapter(
              child: PaymentTotal(),
            )
          ],
        ),
      ),
    );
  }
}
