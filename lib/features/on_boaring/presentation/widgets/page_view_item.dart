import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;

  const PageViewItem(
      {required this.subTitle,
      required this.imagePath,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: 306.w,
          height: 283.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 210.w,
          child: Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).primaryColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
