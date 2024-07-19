import 'package:e_commerce/database_helper/database_helper_purchase_item.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/view_model/controllers/dashboard_controller.dart';
import 'package:e_commerce/view_model/controllers/get_all_products_controller.dart';
import 'package:e_commerce/views/widgets/reusable_list_view_builder.dart';
import 'package:e_commerce/views/widgets/reusable_list_view_dashboard.dart';
import 'package:e_commerce/views/widgets/text_form_field_component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GetAllProductsController getAllProductsController=Get.put(GetAllProductsController());
  
  List<Map<String,dynamic>> purchaseItems=[];
  DatabaseHelperPurchaseItem databaseHelperPurchaseItem =
      DatabaseHelperPurchaseItem();

  @override
  void initState() {
    super.initState();
    getAllProductsController.getAllProductsMethod();
    _fetchCartItems();
  }

  void _fetchCartItems() async {
    List<Map<String, dynamic>> items = await databaseHelperPurchaseItem.getPurchaseItems();
    setState(() {
      purchaseItems = items;
      if(kDebugMode){
        print("Length of the items are ${items.length}");
        print("All purchase Items are $items");
      }
    });
  }

  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
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
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Image.asset("assets/images/profile_image.png"),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldComponent(
                  prefixIcon: Icons.search,
                  bgColor: 0xffffffff,
                  postFixIcon: Icons.mic,
                  hintText: "Search Product",
                  controller: dashboardController
                      .textEditingControllerSearchProduct.value,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Features",
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
                                const SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset("assets/svgs/arrows_svg.svg")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
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
                                const SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset("assets/svgs/filter_svg.svg")
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const ReusableListViewBuilder(),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 189,
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset("assets/images/dashboard_shop_now.png"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff4392F9)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deal Of The Day",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "3hrs 55m 34seconds remaining",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Text(
                                      "View all",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                ReusableListViewDashboard(
                  images: Constants.saleImages,
                  title: Constants.saleTitle,
                  description: Constants.saleDescription,
                  prices: Constants.salePrice,
                  percent: Constants.saleOffPercentage,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/offer.png"),
                        const SizedBox(
                          width: 24,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Special Offers",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Image.asset("assets/images/shocked.png")
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "We make sure you get the\noffer you need at best prices",
                              maxLines: 2,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SvgPicture.asset("assets/svgs/flat_heels.svg"),
                const SizedBox(
                  height: 16,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffFD6E87)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Trending Products",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Last Date 29/02/22",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Text(
                                      "View all",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                ReusableListViewDashboard(
                  title: Constants.saleTitle1,
                  description: Constants.saleDescription1,
                  prices: Constants.salePrice1,
                  percent: Constants.saleOffPercentage1,
                  images: Constants.saleImagesPng,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                topLeft: Radius.circular(8))),
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          "assets/images/hot_summer_sale.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "New Arrivals",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Summer 25 Collections",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xffF83758),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    children: [
                                      Text(
                                        "View all",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sponsored",
                          style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset("assets/images/50_off.png"),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "upto 50% Off",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
