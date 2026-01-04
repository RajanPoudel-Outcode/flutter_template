import 'package:flutter/material.dart';

extension WidgetX on Widget {
  // decorated circular
  BorderRadiusGeometry rounded(double radius) => BorderRadius.circular(radius);

  Padding px(double padding) => Padding(
    padding: .symmetric(horizontal: padding),
    child: this,
  );

  Padding py(double padding) => Padding(
    padding: .symmetric(vertical: padding),
    child: this,
  );

  Padding pOnly({double top = 0, double right = 0, double bottom = 0, double left = 0}) => Padding(
    padding: .only(top: top, right: right, bottom: bottom, left: left),
    child: this,
  );

  Padding pad(double value) => Padding(padding: .all(value), child: this);

  SliverPadding spx(double padding) => SliverPadding(
    padding: .symmetric(horizontal: padding),
    sliver: this,
  );

  SliverPadding spy(double padding) => SliverPadding(
    padding: .symmetric(vertical: padding),
    sliver: this,
  );

  SliverPadding spad(double value) => SliverPadding(padding: .all(value), sliver: this);

  SliverPadding spOnly({double top = 0, double right = 0, double bottom = 0, double left = 0}) =>
      SliverPadding(
        padding: .only(top: top, right: right, bottom: bottom, left: left),
        sliver: this,
      );

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  Container mBottom(double value) => Container(
    margin: .only(bottom: value),
    child: this,
  );
}

extension NumX on num {
  SizedBox get horizontalBox => SizedBox(width: toDouble());

  SizedBox get verticalBox => SizedBox(height: toDouble());

  BorderRadiusGeometry get rounded => .circular(toDouble());
  Radius get radius => .circular(toDouble());

  EdgeInsets get all => .all(toDouble());

  EdgeInsets get horizontal => .symmetric(horizontal: toDouble());

  EdgeInsets get vertical => .symmetric(vertical: toDouble());

  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  String truncateZeros() {
    return truncateToDouble() == this ? toInt().toString() : toString();
  }
}

extension StringNullX on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullNotEmpty => this != null && this!.isNotEmpty;

  String? get firstCharacter => (this == null || this!.isEmpty) ? null : this![0];
}
