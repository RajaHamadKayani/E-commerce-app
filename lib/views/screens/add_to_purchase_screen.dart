import 'package:e_commerce/database_helper/database_helper_purchase_item.dart';
import 'package:e_commerce/views/screens/add_to_purchase_single_item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToPurchaseScreen extends StatefulWidget {
  var itemImage;
  var itemName;
  var itemDescription;
  var itemPrice;
  var itemPercentOff;
  var emailAddress;
  var password;
  var pincode;
  var address;
  var city;
  var state;
  var country;
  var accountNumber;
  var accountName;
  var ifsc;

  AddToPurchaseScreen(
      {super.key,
      this.itemDescription,
      this.accountName,
      this.address,
      this.city,
      this.emailAddress,
      this.password,
      this.pincode,
      this.ifsc,
      this.state,
      this.country,
      this.accountNumber,
      this.itemImage,
      this.itemName,
      this.itemPercentOff,
      this.itemPrice});
  @override
  State<AddToPurchaseScreen> createState() => _AddToPurchaseScreenState();
}

class _AddToPurchaseScreenState extends State<AddToPurchaseScreen> {
  List<Map<String, dynamic>> purchaseItemsList = [];
  DatabaseHelperPurchaseItem databaseHelperPurchaseItem =
      DatabaseHelperPurchaseItem();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPurchaseItemsList();
  }

  void fetchPurchaseItemsList() async {
    List<Map<String, dynamic>> items =
        await databaseHelperPurchaseItem.getPurchaseItems();
    setState(() {
      purchaseItemsList = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      appBar: AppBar(
        backgroundColor: Color(0xffFDFDFD),
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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/address_logo.png"),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Delivery Address",
                  style: GoogleFonts.montserrat(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Adress",
                                style: GoogleFonts.montserrat(
                                    color: Color(0xff000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child:
                                    Image.asset("assets/images/edit_logo.png"),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${purchaseItemsList[0]["address"]}, ${purchaseItemsList[0]["city"]} ${purchaseItemsList[0]["state"]}, ${purchaseItemsList[0]["country"]}",
                            style: GoogleFonts.montserrat(
                                color: Color(0xff000000),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(27),
                            child: Image.asset("assets/images/add_logo.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Shopping List",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: purchaseItemsList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddToPurchaseSingleItemDetails(
                                           accountName: widget.accountName,
                                      accountNumber: widget.accountNumber,
                                      pincode: widget.pincode,
                                      itemDescription: purchaseItemsList[index]["description"],
                                      itemImage: purchaseItemsList[index]["image"],
                                      itemName: purchaseItemsList[index]["title"],
                                      itemPercentOff: purchaseItemsList[index]["percent"],
                                      itemPrice: purchaseItemsList[index]["price"],
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
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 125,
                                        width: 125,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.asset(
                                            purchaseItemsList[index]["image"],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              purchaseItemsList[index]["title"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Variations:",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.black,
                                                      fontSize: 9),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Color(0xf0E0808),
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(2),
                                                    child: Text(
                                                      "Black",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Color(0xf0E0808),
                                                          width: 1.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(2),
                                                    child: Text(
                                                      "Red",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xffCACACA),
                                                          width: 0.5)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(9),
                                                    child: Text(
                                                      purchaseItemsList[index]
                                                          ["price"],
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 11,
                                                ),
                                                Text(
                                                  purchaseItemsList[index]
                                                      ["percent"],
                                                  style: GoogleFonts.montserrat(
                                                      color: Color(0xffEB3030),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: Color(0xffBBBBBB)),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Order (1) :",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "${purchaseItemsList[index]["price"]}",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
