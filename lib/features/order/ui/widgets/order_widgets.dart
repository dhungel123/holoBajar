import 'package:flutter/material.dart';

import 'order_card.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16),
        itemBuilder: (context, index) {
          return OrderCard();
        },
        itemCount: 10,
      ),
    );
  }
}
