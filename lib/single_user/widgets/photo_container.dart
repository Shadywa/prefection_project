import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfection/utilites/app_colors.dart';

class ProfilePhoto extends StatelessWidget {
  final String photoUrl;

  const ProfilePhoto({super.key, required this.photoUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.w,
      width: 100.w,
      margin: EdgeInsets.only(top: 30.w),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 50.w,
            backgroundImage: NetworkImage(photoUrl),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 25.w,
              width: 25.w,
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.camera_enhance,
                  color: AppColors.primaryColor,
                  size: 15.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
