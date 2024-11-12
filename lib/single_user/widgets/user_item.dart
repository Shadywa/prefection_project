import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection/utilites/app_colors.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileListItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.w,
      margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.w),
        color: AppColors.secondaryColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 25.w,
            color: AppColors.mainColor,
          ),
          SizedBox(width: 15.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
