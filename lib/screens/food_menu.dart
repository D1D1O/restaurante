import 'package:flutter/cupertino.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/food_item.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

  final List items = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 32, fontFamily: "Caveat"),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: items.length,
              (context, index) {
                return FoodItem(
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                  imageURI: items[index]["image"],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
