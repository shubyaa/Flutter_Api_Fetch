import 'dart:convert';

class OverViewModel {
  final int? id;
  final String? security;
  final int? industryId;
  final String? industry;
  final int? sectorId;
  final String? sector;
  final double? MCAP;
  final int? EV;
  final int? EVDateEnd;
  final double? BookNavPerShare;
  final double? TTMPE;
  final int? TTMYearEnd;
  final double? Yield;
  final int? YearEnd;
  final String? SectorSlug;
  final String? IndustrySlug;
  final String? SecuritySlug;
  final double? PEGRatio;

  OverViewModel(
    this.id,
    this.security,
    this.industryId,
    this.industry,
    this.sectorId,
    this.sector,
    this.MCAP,
    this.EV,
    this.EVDateEnd,
    this.BookNavPerShare,
    this.TTMPE,
    this.TTMYearEnd,
    this.Yield,
    this.YearEnd,
    this.SectorSlug,
    this.IndustrySlug,
    this.SecuritySlug,
    this.PEGRatio,
  );

  factory OverViewModel.fromMap(Map<String, dynamic> json) {
    return OverViewModel(
        json["ID"],
        json["Security"],
        json["IndustryID"],
        json["Industry"],
        json["SectorID"],
        json["Sector"],
        json["MCAP"],
        json["EV"],
        json["EVDateEnd"],
        json["BookNavPerS"],
        json["TTMPE"],
        json["TTMYearEnd"],
        json["Yield"],
        json["YearEnd"],
        json["SectorSlug"],
        json["IndustrySlug"],
        json["SecuritySlug"],
        json["PEGRatio"]);
  }

  factory OverViewModel.fromJson(Map<String, dynamic> json) {
    return OverViewModel(
        json["ID"],
        json["Security"],
        json["IndustryID"],
        json["Industry"],
        json["SectorID"],
        json["Sector"],
        json["MCAP"],
        json["EV"],
        json["EVDateEnd"],
        json["BookNavPerS"],
        json["TTMPE"],
        json["TTMYearEnd"],
        json["Yield"],
        json["YearEnd"],
        json["SectorSlug"],
        json["IndustrySlug"],
        json["SecuritySlug"],
        json["PEGRatio"]);
  }
}
