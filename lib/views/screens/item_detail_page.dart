import 'package:e_commerce/database_helper/database_helper.dart';
import 'package:e_commerce/views/screens/edit_profile_screen.dart';
import 'package:e_commerce/views/screens/wish_list_screen.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ItemDetailPage extends StatefulWidget {
  var itemImage;
  var itemName;
  var itemDescription;
  var itemPrice;
  var itemPercentOff;
  ItemDetailPage(
      {super.key,
      this.itemDescription,
      this.itemImage,
      this.itemName,
      this.itemPercentOff,
      this.itemPrice});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  String initialValue = "7UK";
  final DatabaseHelper db = DatabaseHelper();

  void _addToCart() async {
    Map<String, dynamic> item = {
      'title': widget.itemName,
      'description': widget.itemDescription,
      'price': widget.itemPrice,
      'percent': widget.itemPercentOff,
      'image': widget.itemImage,
    };
    await db.saveItem(item);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${widget.itemName} added to cart")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        _addToCart();
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.itemImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Size: 7UK",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                    itemCount: Constants.imageDetailPageSizeList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              initialValue =
                                  Constants.imageDetailPageSizeList[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: initialValue ==
                                        Constants.imageDetailPageSizeList[index]
                                    ? const Color(0xffFA7189)
                                    : const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    width: 1.5,
                                    color: const Color(0xffFA7189))),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                Constants.imageDetailPageSizeList[index],
                                style: GoogleFonts.montserrat(
                                    color: initialValue ==
                                            Constants
                                                .imageDetailPageSizeList[index]
                                        ? Color(0xffffffff)
                                        : Color(0xffFA7189),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.itemName,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.itemDescription,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                height: 20,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: double.infinity,
                              width: 20,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(
                                    "assets/images/rating_star.png"),
                              ),
                            )),
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${widget.itemPrice}  ",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
                TextSpan(
                    text: "${widget.itemPercentOff} ",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xffFA7189),
                        fontWeight: FontWeight.w600,
                        fontSize: 14))
              ])),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Product Details",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Perhaps the most iconic sneaker of all-time, this original Chicago? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...More",
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 25,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: Constants.detailPagemoreDetailsText.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: const Color(0xff828282), width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(Constants
                                    .detailPageMoreDetailsImages[index]),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  Constants.detailPagemoreDetailsText[index],
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xff828282),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WishListScreen()));
                      },
                      child: Image.asset("assets/images/go_to_cart.png")),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                      itemDescription: widget.itemDescription,
                                      itemImage: widget.itemImage,
                                      itemName: widget.itemName,
                                      itemPercentOff: widget.itemPercentOff,
                                      itemPrice: widget.itemPrice,
                                    )));
                      },
                      child: Image.asset("assets/images/buy_now.png")),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xffFFCCD5),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 11, horizontal: 26),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delievery in",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      Text(
                        "1 within Hour",
                        style: GoogleFonts.poppins(
                            color: Color(0xff010101),
                            fontWeight: FontWeight.w600,
                            fontSize: 21),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
