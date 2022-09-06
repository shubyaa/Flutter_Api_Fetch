import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/API/fetchData.dart';
import 'package:flutter_application/overView.dart';
import 'package:flutter_application/performance.dart';

String overViewApi =
    "https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en";

String _performanceApi =
    """https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en""";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/overview',
      routes: {
        '/overview': (context) =>
            OverView(modelList: overViewData(overViewApi)),
        '/performance': (context) => Performance(
              modelList: fetchDat(_performanceApi),
            ),
      },
    );
  }
}
