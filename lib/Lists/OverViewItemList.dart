import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application/Models/OverViewModel.dart';
import 'package:humanize_big_int/humanize_big_int.dart';

TextStyle styleText = TextStyle(
  fontSize: 15,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

class OverViewItemList extends StatelessWidget {
  final List<OverViewModel> list;

  const OverViewItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return OverViewItem(
          model: list[index],
        );
      },
    );
  }
}

class OverViewItem extends StatefulWidget {
  final OverViewModel model;
  const OverViewItem({Key? key, required this.model}) : super(key: key);

  @override
  State<OverViewItem> createState() => _OverViewItemState();
}

class _OverViewItemState extends State<OverViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: ListTileChilds(widget.model),
        ),
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

List<Widget> ListTileChilds(OverViewModel model) {
  List<Widget> childs = [
    ListTile(
      leading: Text(
        "Section",
        style: styleText,
      ),
      trailing: Text(
        model.sector ?? "-",
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Industry",
        style: styleText,
      ),
      trailing: Text(
        model.industry ?? "-",
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Dividend Yeild",
        style: styleText,
      ),
      trailing: Text(
        format(model.Yield),
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Market-Cap",
        style: styleText,
      ),
      trailing: Text(
        humanizeInt(model.MCAP!.toInt()),
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Enterprise Value (EV)",
        style: styleText,
      ),
      trailing: Text(
        model.EV.toString(),
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Book Value/ Share",
        style: styleText,
      ),
      trailing: Text(
        format(model.BookNavPerShare),
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Bank Yeild",
        style: styleText,
      ),
      trailing: Text(
        format(model.Yield),
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Year End",
        style: styleText,
      ),
      trailing: Text(
        format(model.YearEnd!.toDouble()),
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Sector Slug",
        style: styleText,
      ),
      trailing: Text(
        model.SectorSlug!,
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Industry Slug",
        style: styleText,
      ),
      trailing: Text(
        model.IndustrySlug!,
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Security Slug",
        style: styleText,
      ),
      trailing: Text(
        model.SecuritySlug!,
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "Pre-Earning Ratio",
        style: styleText,
      ),
      trailing: Text(
        format(model.TTMPE),
        style: styleText,
      ),
    ),
    ListTile(
      leading: Text(
        "PEG Ratio",
        style: styleText,
      ),
      trailing: Text(
        format(model.PEGRatio),
        style: styleText,
      ),
    ),
  ];
  return childs;
}
