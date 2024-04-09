import 'package:flutter/material.dart';

import '../../../../core/common widgets/cards/product_card.dart';

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 16),
        itemBuilder: (context, index) {
          return ProductCards();
        },
        itemCount: 10,
      ),
    );
  }
}