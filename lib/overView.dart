import 'package:flutter/material.dart';
import 'package:flutter_application/Lists/OverViewItemList.dart';
import 'package:flutter_application/Models/OverViewModel.dart';

class OverView extends StatefulWidget {
  const OverView({Key? key, required this.modelList}) : super(key: key);

  final Future<List<OverViewModel>> modelList;

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            "Overview",
            style: TextStyle(
              color: Colors.indigo[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: FutureBuilder<List<OverViewModel>>(
                  future: widget.modelList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print("->  $snapshot.error");
                    return snapshot.hasData
                        ? OverViewItemList(list: snapshot.data!)
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: MaterialButton(
                hoverColor: Colors.blue,
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/performance");
                },
                child: Text("Performance"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
