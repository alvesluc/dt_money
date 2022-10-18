import 'package:flutter/material.dart';

class ColumnBuilder extends StatelessWidget {
  const ColumnBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) {
          return itemBuilder(context, index);
        },
      ).reversed.toList(),
    );
  }
}

// final int itemIndex = index ~/ 2;
//          final Widget widget;
//          if (index.isEven) {
//            widget = itemBuilder(context, itemIndex);
//          } else {
//            widget = separatorBuilder(context, itemIndex);
//            assert(() {
//              if (widget == null) {
//                throw FlutterError('separatorBuilder cannot return null.');
//              }
//              return true;
//            }());
//          }
