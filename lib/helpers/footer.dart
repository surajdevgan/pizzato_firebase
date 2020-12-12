import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_firebase/views/my_cart.dart';

class Footers extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: MyCart(), type: PageTransitionType.bottomToTop));
      },
      child: Icon(EvaIcons.shoppingBag),
    );
  }
}
