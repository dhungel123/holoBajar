
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holo_bazar/core/constants/routes.dart';

import '../../../../core/common widgets/buttons/custom_rounded_button.dart';
import 'cart_card.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 16),
            itemBuilder: (context, index) {
              return CartCard();
            },
            itemCount: 10,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, -3),
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 10,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "Total Cost: Rs. 2000000",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 4),
              CustomRoundedButtom(
                title: "Checkout",
                onPressed: () {
                  Navigator.of(context).pushNamed(
                   MyRoutes.checkout,
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}