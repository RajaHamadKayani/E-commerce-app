import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WiahlistReusableDialogBox extends StatefulWidget {
  final Future<void> Function() function;
  WiahlistReusableDialogBox({super.key, required this.function});

  @override
  State<WiahlistReusableDialogBox> createState() =>
      _WiahlistReusableDialogBoxState();
}

class _WiahlistReusableDialogBoxState extends State<WiahlistReusableDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Delete All WishList Items",
        style: GoogleFonts.montserrat(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: Text(
        "Are you sure want to delete all wishlist Items",
        style: GoogleFonts.montserrat(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xffF83758),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () async {
                await widget.function().then((value) {
                  Navigator.pop(context);

                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Done();
                      });
                });
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xffF83758),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "Ok",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/done.png"),
                Image.asset("assets/images/tick.png")
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "You have successfully deleted all items from wishList",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            )
          ],
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: const Color(0xffF83758),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    "OK",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
