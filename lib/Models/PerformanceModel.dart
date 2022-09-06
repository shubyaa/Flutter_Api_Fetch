import 'dart:convert';

class PerformanceModel {
  final int id;
  final String label;
  final String ChartPeriodCode;
  final double changePercent;

  PerformanceModel(
      this.id, this.label, this.ChartPeriodCode, this.changePercent);

  factory PerformanceModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return PerformanceModel(json['ID'], json['Label'], json['ChartPeriodCode'],
        json['ChangePercent']);
  }
}
