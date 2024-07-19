import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/views/screens/add_to_purchase_screen.dart';
import 'package:e_commerce/views/screens/dashboard.dart';
import 'package:e_commerce/views/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
class DrawerListTile extends StatefulWidget {
  const DrawerListTile({super.key});

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  goToScreen(int index){
    switch(index){
      case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
      break;
      case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context)=> WishListScreen()));
      break;
      case 2:
      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddToPurchaseScreen()));
      break;
      default:
      return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Constants.drawerTitle.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index){
        return Padding(padding: EdgeInsets.only(bottom: 5),
        child: InkWell(
          onTap: (){
            goToScreen(index);
          },
          child: ListTile(
            title: Text(Constants.drawerTitle[index]),
            leading: Icon(Constants.drawerIcons[index]),
          ),
        ),);

      }),
    );
  }
}