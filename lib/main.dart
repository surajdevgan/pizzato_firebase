import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzato_firebase/Providers/authentication.dart';
import 'package:pizzato_firebase/Providers/calculations.dart';
import 'package:pizzato_firebase/helpers/footer.dart';
import 'package:pizzato_firebase/helpers/headers.dart';
import 'package:pizzato_firebase/helpers/middle.dart';
import 'package:pizzato_firebase/services/manageData.dart';
import 'package:pizzato_firebase/services/maps.dart';
import 'package:pizzato_firebase/views/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: Calculations()),
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: MiddleHelpers()),
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Footers()),
        ChangeNotifierProvider.value(value: GenerateMaps())
      ],
      child: MaterialApp(
        title: 'Pizzato',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Figno',
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
