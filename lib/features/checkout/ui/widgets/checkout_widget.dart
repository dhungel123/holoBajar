
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/common widgets/buttons/custom_rounded_button.dart';
import '../../../../core/common widgets/textfields/custom_textfield.dart';
import '../../../../core/constants/custom_themes.dart';
import 'order_confirm_dialog.dart';

class CheckoutWidgets extends StatefulWidget {
  const CheckoutWidgets({super.key});

  @override
  State<CheckoutWidgets> createState() => _CheckoutWidgetsState();
}

class _CheckoutWidgetsState extends State<CheckoutWidgets> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.primaryColor,
        title: Text(
          "Checkout",
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomTextField(
                  label: "Full Name",
                  hintText: "Full Name",
                  fieldName: "full_name",
                ),
                CustomTextField(
                  label: "Phone Number",
                  hintText: "Phone Number",
                  fieldName: "phone_number",
                ),
                CustomTextField(
                  label: "City",
                  hintText: "City",
                  fieldName: "city",
                ),
                CustomTextField(
                  label: "Address",
                  hintText: "Address",
                  fieldName: "address",
                ),
                CustomRoundedButtom(
                  title: "Confirm Order",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return OrderConfirmDialog();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}