import 'package:festival_post_app/components/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes/routes.dart';

Widget festival({
  required int index,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        Routes.detail,
        arguments: festivalmap[index],
      );
    },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffb4e6ff),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            festivalmap[index].name,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              // color: Color(0xffb4e6ff),
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            festivalmap[index].description,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '${festivalmap[index].date} ${festivalmap[index].month}',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
