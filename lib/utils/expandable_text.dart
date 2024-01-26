import 'package:coffee_shop_app_coding_challenge/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final double max;
  final TextStyle style;
  const ExpandableText({
    Key? key,
    required this.text,
    required this.max,
    required this.style,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  TextPainter? textPainter;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return isOpen
        ? SizedBox(
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(text: widget.text, style: widget.style),
                    WidgetSpan(
                      style: widget.style,
                      child: InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        child: Text(
                          " Less more",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.mainColors,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              maxLines: 3,
              text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "${widget.text.substring(0, int.parse("${(widget.text.length * widget.max).toInt()}"))}..",
                      style: widget.style),
                  WidgetSpan(
                    style: widget.style,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      mouseCursor: SystemMouseCursors.click,
                      onTap: () {
                        setState(() {
                          isOpen = !isOpen;
                        });
                      },
                      child: Text(
                        "Read More",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.mainColors,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
