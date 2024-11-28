import 'package:bookhotel/core/constant/sizes_constant.dart';
import 'package:flutter/material.dart';


class AppPadding{
  ///PaddingWithAppBarHeight
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: AppSizes.appBarHeight,
    right: AppSizes.defaultSpaceMd,
    bottom: AppSizes.defaultSpaceMd,
    left: AppSizes.defaultSpaceMd,
  );

  ///paddingWithAppBarHeight Small
  static const EdgeInsetsGeometry paddingWithAppBarHeightSm = EdgeInsets.only(
    top: AppSizes.appBarHeightSm,
    right: AppSizes.defaultSpaceMd,
    bottom: AppSizes.defaultSpaceMd,
    left: AppSizes.defaultSpaceMd,
  );

  ///paddingWithAppBarHeight BG
  static const EdgeInsetsGeometry paddingWithAppBarHeightBg = EdgeInsets.only(
    top: AppSizes.appBarHeightBg,
    right: AppSizes.defaultSpaceMd,
    bottom: AppSizes.defaultSpaceMd,
    left: AppSizes.defaultSpaceMd,
  );
}