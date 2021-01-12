import 'package:flutter/material.dart';
import 'package:pizzato_firebase/helpers/footer.dart';
import 'package:pizzato_firebase/helpers/headers.dart';
import 'package:pizzato_firebase/helpers/middle.dart';
import 'package:pizzato_firebase/services/manageMaps.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footers().floatingActionButton(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headers().appBar(context),
              Headers().headerText(),
              Headers().headerMenu(context),
              Divider(),
              MiddleHelpers().favText(),
              MiddleHelpers().fovouriteData(context, 'favourite'),
              MiddleHelpers().businessText(),
              MiddleHelpers().BusinessData(context, 'business')
            ],
          ),
        ),
      ),
    );
  }
}
