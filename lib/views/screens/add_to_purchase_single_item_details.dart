import 'package:e_commerce/views/screens/proceed_to_payment_screen.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToPurchaseSingleItemDetails extends StatefulWidget {
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

  const AddToPurchaseSingleItemDetails({
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
  State<AddToPurchaseSingleItemDetails> createState() =>
      _AddToPurchaseSingleItemDetailsState();
}

class _AddToPurchaseSingleItemDetailsState
    extends State<AddToPurchaseSingleItemDetails> {
  String selectedSize = Constants.sizesAndQuantityList[0];
  String selectedQuantity = Constants.sizesAndQuantityList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFDFDFD),
        title: Text(
          "Shopping Bag",
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
        ],
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      backgroundColor: const Color(0xffFDFDFD),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 37),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 153,
                        width: 123,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            widget.itemImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 21),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.itemName,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.itemDescription,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Size",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Quantity",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xffF2F2F2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: DropdownButtonFormField<String>(
                                        value: selectedSize,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Size",
                                          hintStyle: GoogleFonts.montserrat(
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        ),
                                        items: Constants.sizesAndQuantityList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: GoogleFonts.montserrat(
                                                  color: const Color(0xff000000),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedSize = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: const Color(0xffF2F2F2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: DropdownButtonFormField<String>(
                                        value: selectedQuantity,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Quantity",
                                          hintStyle: GoogleFonts.montserrat(
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        ),
                                        items: Constants.sizesAndQuantityList
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: GoogleFonts.montserrat(
                                                  color: const Color(0xff000000),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedQuantity = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Delivered by ",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13)),
                              TextSpan(
                                  text: "16 May 2024",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16))
                            ]))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/coupon_logo.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Apply Coupons",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Text(
                    "Select",
                    style: GoogleFonts.montserrat(
                        color: Color(0xffF83758),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                height: 1,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xffCACACA)),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Order Payment Details",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 26,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Amounts",style: GoogleFonts.montserrat(color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),),
                   Text("${widget.itemPrice}",style: GoogleFonts.montserrat(color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),)
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               RichText(text: TextSpan(children: 
               [
                TextSpan(text: "Convenience  ",
                style: 
                 GoogleFonts.montserrat(color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),),
                  TextSpan(text: "know more",
                style: 
                 GoogleFonts.montserrat(color: Color(0xffF83758),
                  fontWeight: FontWeight.w600,
                  fontSize: 12),)
               ])),
               Text("Apply Coupon",
               style:   GoogleFonts.montserrat(color: Color(0xffEA1712),
                  fontWeight: FontWeight.w600,
                  fontSize: 12),)
                ],
              ),
                 const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery Free",style: GoogleFonts.montserrat(color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),),
                   Text("Free",style: GoogleFonts.montserrat(color: Color(0xffF83758),
                  fontWeight: FontWeight.w600,
                  fontSize: 14),)
                ],
              ),
              const SizedBox(height: 40,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)
                  ),
                  color: Color(0xffF8F8F8)
                ),
                child: Padding(padding: EdgeInsets.all(22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.itemPrice,
                        style: GoogleFonts.montserrat(color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),),
                        const SizedBox(height: 6,),
                        Text("View Details",
                        style: GoogleFonts.montserrat(
                          color: Color(0xffF83758),
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                        ),)
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  ProceedToPaymentScreen(
                             accountName: widget.accountName,
                                      accountNumber: widget.accountNumber,
                                      selectedQuantity: selectedQuantity,
                                      selectedSize: selectedSize,
                                      pincode: widget.pincode,
                                      itemDescription:widget.itemDescription,
                                      itemImage: widget.itemImage,
                                      itemName: widget.itemName,
                                      itemPercentOff: widget.itemPercentOff,
                                      itemPrice: widget.itemPrice,
                                      address: widget.address,
                                      ifsc:widget.ifsc,
                                      emailAddress:widget.emailAddress,
                                      state: widget.state,
                                      password: widget.password,
                                      country: widget.country,
                                      city:widget.city,
                        )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffF83758)
                        ),
                        child: Padding(padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text("Proceed To Payment",
                          style: GoogleFonts.montserrat(color: Colors.white),),
                        ),),
                      ),
                    )
                  ],
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
