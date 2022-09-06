import 'package:flutter/material.dart';
import 'package:flutter_application/Models/PerformanceModel.dart';

class PerformanceListItem extends StatefulWidget {
  final PerformanceModel model;
  const PerformanceListItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<PerformanceListItem> createState() => _PerformanceListItemState();
}

class _PerformanceListItemState extends State<PerformanceListItem> {
  bool is_positve() {
    if (widget.model.changePercent > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.model.label,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            height: 20,
            width: MediaQuery.of(context).size.width * 0.6,
            child: LinearProgressIndicator(
              value: widget.model.changePercent.abs() / 100,
              color: is_positve() ? Colors.green[900] : Colors.red,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: is_positve()
                        ? Icon(
                            Icons.arrow_upward_rounded,
                            size: 20,
                            color: Colors.green[900],
                          )
                        : Icon(
                            Icons.arrow_downward_rounded,
                            size: 20,
                            color: Colors.red,
                          ),
                  ),
                  Text(
                    format(widget.model.changePercent),
                    style: TextStyle(
                      color: is_positve() ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String format(double? n) {
  if (n != null) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  } else {
    return "-";
  }
}
