import 'package:flutter/material.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/views/common/app_style.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
            constraints: isExpanded
                ? const BoxConstraints() // No height restriction
                : const BoxConstraints(maxHeight: 110.0), // Limit height when collapsed
            child: Text(
              widget.text,
              softWrap: true,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.fade,
              style: appStyle(12, Color(kDarkGrey.value), FontWeight.normal),
            ),
          ),
        ),
        TextButton(
          child: Text(isExpanded ? 'See Less' : 'See More'),
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded; // Toggle the expanded state
            });
          },
        ),
      ],
    );
  }
}