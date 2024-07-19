import 'package:e_commerce/database_helper/database_helper_purchase_item.dart';
import 'package:e_commerce/views/screens/add_to_purchase_screen.dart';
import 'package:e_commerce/view_model/controllers/edit_profile_controller.dart';
import 'package:e_commerce/views/widgets/edit_profile_reusable_text_form_field.dart';
import 'package:e_commerce/views/widgets/text_form_field_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  var itemImage;
  var itemName;
  var itemDescription;
  var itemPrice;
  var itemPercentOff;
  EditProfileScreen(
      {super.key,
      this.itemDescription,
      this.itemImage,
      this.itemName,
      this.itemPercentOff,
      this.itemPrice});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DatabaseHelperPurchaseItem databaseHelperPurchaseItem =
      DatabaseHelperPurchaseItem();

  EditProfileController editProfileController =
      Get.put(EditProfileController());

  void addToPurchaseMethod() async {
    Map<String, dynamic> addToPurchase = {
      "name": editProfileController
          .textEditingControllerAccountHolderName.value.text,
      "address": editProfileController.textEditingControllerAddress.value.text,
      "email": editProfileController.textEditingControllerEmail.value.text,
      "ifsc": editProfileController.textEditingControllerIFSCCode.value.text,
      "country": editProfileController.textEditingControllerCountry.value.text,
      "state": editProfileController.textEditingControllerState.value.text,
      "city": editProfileController.textEditingControllerCity.value.text,
      "pincode": editProfileController.textEditingControllerPinCode.value.text,
      "account": editProfileController
          .textEditingControllerBankAccountNumber.value.text,
      "image": widget.itemImage,
      "price": widget.itemPrice,
      "title": widget.itemName,
      "description": widget.itemDescription,
      "percent": widget.itemPercentOff
    };
    await databaseHelperPurchaseItem.saveItem(addToPurchase).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Item Saved")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffFDFDFD),
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
        padding: EdgeInsets.only(top: 31),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset("assets/images/profile_image.png"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Personal Details",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email Address",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerEmail.value,
                      hintText: "Enter your Email Address",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerPassword.value,
                      hintText: "Enter your Password",
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Change password",
                        style: GoogleFonts.plusJakartaSans(
                            color: Color(0xffF83758),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: BoxDecoration(color: Color(0xffC4C4C4)),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    Text(
                      "Business Address Details",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "pincode",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerPinCode.value,
                      hintText: "Enter your pincode",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Address",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerAddress.value,
                      hintText: "Enter your address",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "City",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller:
                          editProfileController.textEditingControllerCity.value,
                      hintText: "Enter your City",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "State",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerState.value,
                      hintText: "Enter your state",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Country",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerCountry.value,
                      hintText: "Enter your Country",
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: BoxDecoration(color: Color(0xffC4C4C4)),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Bank Account Details",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Bank Account Number",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerBankAccountNumber.value,
                      hintText: "Enter your Bank Account Number",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Account Holder's Name",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerAccountHolderName.value,
                      hintText: "Enter account holder name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "IFSC Number",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EditProfileReusableTextFormField(
                      controller: editProfileController
                          .textEditingControllerIFSCCode.value,
                      hintText: "Enter IFSC Number",
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    GestureDetector(
                      onTap: () {
                        addToPurchaseMethod();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddToPurchaseScreen(
                                      accountName: editProfileController
                                          .textEditingControllerAccountHolderName
                                          .value
                                          .text,
                                      accountNumber: editProfileController
                                          .textEditingControllerBankAccountNumber
                                          .value
                                          .text,
                                      pincode: editProfileController
                                          .textEditingControllerPinCode
                                          .value
                                          .text,
                                      itemDescription: widget.itemDescription,
                                      itemImage: widget.itemImage,
                                      itemName: widget.itemName,
                                      itemPercentOff: widget.itemPercentOff,
                                      itemPrice: widget.itemPrice,
                                      address: editProfileController
                                          .textEditingControllerAddress
                                          .value
                                          .text,
                                      ifsc: editProfileController
                                          .textEditingControllerIFSCCode
                                          .value
                                          .text,
                                      emailAddress: editProfileController
                                          .textEditingControllerEmail
                                          .value
                                          .text,
                                      state: editProfileController
                                          .textEditingControllerState
                                          .value
                                          .text,
                                      password: editProfileController
                                          .textEditingControllerPassword
                                          .value
                                          .text,
                                      country: editProfileController
                                          .textEditingControllerCountry
                                          .value
                                          .text,
                                      city: editProfileController
                                          .textEditingControllerCity.value.text,
                                    )));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffF83758)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Center(
                            child: Text(
                              "Save",
                              style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
