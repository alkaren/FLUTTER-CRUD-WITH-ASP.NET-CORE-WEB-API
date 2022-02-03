import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_http_example/post_result_model.dart';
import 'package:flutter_http_example/src/app.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(App());
}

// void main() {
//   HttpOverrides.global = MyHttpOverrides();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

// class _MyAppState extends State<MyApp> {
//   Brands brandResult = null;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("API DEMO"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Text((brandResult != null) ? brandResult.id.toString() + " " + brandResult.brand_name : "Tidak ada data"),
//               RaisedButton(
//                 onPressed: () {
//                   Brands.connectToAPI(0, "Test Brand Name").then((value) => brandResult = value);
//                   setState(() {});
//                 },
//                 child: Text("POST"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
