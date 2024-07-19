import 'package:e_commerce/database_helper/database_helper.dart';
import 'package:e_commerce/view_model/controllers/dashboard_controller.dart';
import 'package:e_commerce/views/widgets/text_form_field_component.dart';
import 'package:e_commerce/views/widgets/wiahList_reusable_dialog_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  void _fetchCartItems() async {
    List<Map<String, dynamic>> items = await db.getCartItems();
    setState(() {
      _cartItems = items;
    });
  }

  Future<void> _deleteCartItem(int id) async {
    await db.deleteItem(id);
    _fetchCartItems();
  
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from wish list')),
    );
  }

  Future<void> deleteAllCartItems() async {
    await db.deleteAllItems();
    _fetchCartItems();
      if(kDebugMode){
      print("All Cart list after updating $_cartItems");
    }
   
  }

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SvgPicture.asset("assets/svgs/menu.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 113,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SvgPicture.asset("assets/svgs/splash_logo.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WiahlistReusableDialogBox(
                                  function: deleteAllCartItems,
                                );
                              });
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              TextFormFieldComponent(
                prefixIcon: Icons.search,
                bgColor: 0xffffffff,
                postFixIcon: Icons.mic,
                hintText: "Search Product",
                controller: dashboardController
                    .textEditingControllerSearchProduct.value,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10+ Items",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: 61,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sort",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset("assets/svgs/arrows_svg.svg")
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 24,
                        width: 61,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Filter",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset("assets/svgs/filter_svg.svg")
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: _cartItems.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final item = _cartItems[index];
                    return GestureDetector(
                      onTap: () async {
                        await _deleteCartItem(item['id']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(item["image"]),
                              ),
                            ),
                            Text(
                              item["title"],
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              item["description"],
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              item["price"],
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
