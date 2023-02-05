import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final int truncateTextLength;
  final bool? isElipssis;

  const ResponsiveText({
    super.key,
    required this.title,
    required this.textStyle,
    this.isElipssis,
    required this.truncateTextLength,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      textDirection: TextDirection.rtl,
      overflowReplacement: Text(
        '${title.substring(0, title.length - truncateTextLength)}...',
        overflow: isElipssis != null ? TextOverflow.ellipsis : null,
        maxLines: 1,
        style: textStyle,
      ),
      maxLines: 1,
      style: textStyle,
    );
  }
}
