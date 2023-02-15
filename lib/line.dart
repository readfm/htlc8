
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FLine extends StatefulWidget {
  String content;
  Function(String)? onSelect;
  FLine(this.content, {super.key, this.onSelect});

  @override
  State<FLine> createState() => _FLineState();
}

class _FLineState extends State<FLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...elements,
      ],
    );
  }

  List<Widget> get elements {
    final optFirst = widget.content.indexOf('|');
    final optLast = widget.content.lastIndexOf('|');
    final arr = <Widget>[];
    if (optLast > optFirst) {
      final options =
          widget.content.substring(optFirst + 1, optLast).split('|');

      arr.add(
        Text(
          widget.content.substring(0, optFirst),
          textAlign: TextAlign.left,
        ),
      );
      for (var i = 0; i < options.length; i++) {
        final option = options[i];
        arr.add(
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(right: i < options.length - 1 ? 4 : 0),
              child: Text(
                option,
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            onTap: () {
              final before = widget.content.substring(0, optFirst),
                  after = widget.content.substring(optLast + 1);

              widget.onSelect?.call(
                "$before $option $after",
              );
            },
          ),
        );
      }
      arr.add(
        Text(
          widget.content.substring(optLast + 1),
          textAlign: TextAlign.left,
        ),
      );
    } else {
      arr.add(
        Text(
          widget.content,
          textAlign: TextAlign.left,
        ),
      );
    }
    return arr;
  }
}
