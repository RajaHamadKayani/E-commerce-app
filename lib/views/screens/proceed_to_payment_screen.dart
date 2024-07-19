import 'package:e_commerce/view_model/controllers/proceed_to_payment_controller.dart';
import 'package:e_commerce/views/widgets/proceed_to_payment_dialog_box.dart';
import 'package:e_commerce/views/widgets/proceed_to_payment_text_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProceedToPaymentScreen extends StatefulWidget {
  final String itemImage;
  final String itemName;
  final String itemDescription;
  final String itemPrice;
  final String itemPercentOff;
  final String emailAddress;
  final String password;
  final String pincode;
  final String address;
  final String city;
  final String state;
  final String country;
  final String accountNumber;
  final String accountName;
  final String ifsc;

  const ProceedToPaymentScreen({
    super.key,
    required this.itemDescription,
    required this.accountName,
    required this.address,
    required this.city,
    required this.emailAddress,
    required this.password,
    required this.pincode,
    required this.ifsc,
    required this.state,
    required this.country,
    required this.accountNumber,
    required this.itemImage,
    required this.itemName,
    required this.itemPercentOff,
    required this.itemPrice,
  });

  @override
  State<ProceedToPaymentScreen> createState() => _ProceedToPaymentScreenState();
}

class _ProceedToPaymentScreenState extends State<ProceedToPaymentScreen> {
  ProceedToPaymentController proceedToPaymentController=ProceedToPaymentController();
  final String shipmentPrice = '₹30';
  late double sum;

  @override
  void initState() {
    super.initState();
    sum = convertToPrice();
    if (kDebugMode) {
      print("Name of the item ${widget.itemName}");
      print("Description of the item ${widget.itemDescription}");
      print("Percent off ${widget.itemPercentOff}");
      print("Price of the item ${widget.itemPrice}");
      print("Account name ${widget.accountName}");
      print("Account number ${widget.accountNumber}");
    }
  }

  double convertToPrice() {
    double value1 = double.parse(shipmentPrice.replaceAll('₹', '').trim());
    double value2 = double.parse(widget.itemPrice.replaceAll('₹', '').trim());
    return value1 + value2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffFDFDFD),
        title: Text(
          "Checkout",
          style: GoogleFonts.montserrat(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: const Color(0xffFDFDFD),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xffA8A8A9),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Flexible(
                    child: Text(
                      widget.itemPrice,
                      style: GoogleFonts.montserrat(
                          color: const Color(0xffA8A8A9),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shipping",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xffA8A8A9),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Text(
                    shipmentPrice,
                    style: GoogleFonts.montserrat(
                        color: const Color(0xffA8A8A9),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff4C5059),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    "₹${sum.toStringAsFixed(2)}",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff4C5059),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  )
                ],
              ),
              const SizedBox(height: 22,),
              Container(
                height: 1.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4)
                ),
              ),
              const SizedBox(height: 28,),
              Text("Payment",
              style: GoogleFonts.montserrat(color: Color(0xff222222),
              fontWeight: FontWeight.w600,
              fontSize: 18),),
              const SizedBox(height: 10,),
              ProceedToPaymentTextFieldWidget(hintText: "Enter Visa", imagePath: "assets/images/visa.png",
              controller: proceedToPaymentController.textEditingControllerVisa.value,),
              const SizedBox(height: 25,),
                ProceedToPaymentTextFieldWidget(hintText: "Enter Paypal", imagePath: "assets/images/paypal.png",
              controller: proceedToPaymentController.textEditingControllerPaypal.value,),
              const SizedBox(height: 25,),
                ProceedToPaymentTextFieldWidget(hintText: "Enter Monestro", imagePath: "assets/images/maestro.png",
              controller: proceedToPaymentController.textEditingControllerMaestro.value,),const SizedBox(height: 25,),
                ProceedToPaymentTextFieldWidget(hintText: "Enter Apple", imagePath: "assets/images/apple.png",
              controller: proceedToPaymentController.textEditingControllerApple.value,),
              const SizedBox(height: 25,),
              GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return const  ProceedToPaymentDialogBox();
                  });
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF83758)
                  ),
                  child: Padding(padding: EdgeInsets.symmetric(vertical: 18),
                  child: Center(
                    child: Text("Continue",
                    style: GoogleFonts.montserrat(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),),
                  ),),
                ),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
