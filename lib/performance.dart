import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/API/fetchData.dart';
import 'package:flutter_application/Lists/PerformanceList.dart';
import 'package:flutter_application/Models/PerformanceModel.dart';

class Performance extends StatefulWidget {
  final Future<List<PerformanceModel>> modelList;

  Performance({
    Key? key,
    required this.modelList,
  }) : super(key: key);

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            "Performance",
            style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<PerformanceModel>>(
                future: widget.modelList,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            PerformanceModel model =
                                snapshot.data!.elementAt(index);
                            return PerformanceListItem(model: model);
                          },
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: MaterialButton(
                hoverColor: Colors.blue,
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.popAndPushNamed(context, "/overview");
                },
                child: Text("Overview"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
