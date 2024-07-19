import 'package:e_commerce/views/screens/item_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableListViewDashboard extends StatefulWidget {
  var images;
  var title;
  var description;
  var prices;
  var percent;
  ReusableListViewDashboard(
      {super.key,
      this.description,
      this.images,
      this.percent,
      this.prices,
      this.title});

  @override
  State<ReusableListViewDashboard> createState() =>
      _ReusableListViewDashboardState();
}

class _ReusableListViewDashboardState extends State<ReusableListViewDashboard> {
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: ListView.builder(
          itemCount: widget.title.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemDetailPage(
                                itemDescription: widget.description[index],
                                itemImage: widget.images[index],
                                itemName: widget.title[index],
                                itemPercentOff: widget.percent[index],
                                itemPrice: widget.prices[index],
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(widget.images[index] ?? [])),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title[index] ?? [],
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              widget.description[index] ?? [],
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              widget.prices[index] ?? [],
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              widget.percent[index] ?? [],
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xffFE735C),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
