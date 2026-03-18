import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../gen/colors.gen.dart';
import '../services/device_size_service.dart';

createGraphShimmerLoading({String? type}) {
  return Container(
    decoration: BoxDecoration(
      color: ColorName.colorWhite,
      borderRadius: BorderRadius.circular(getHeight() * 0.8),
      boxShadow: [BoxShadow(color: ColorName.colorBlack.withOpacity(0.6))],
    ),
    padding: EdgeInsets.symmetric(
      horizontal: getHeight() * 1.2,
      vertical: getHeight() * 2.0,
    ),
    child: Container(),
  );
}

createShimmerEffect(Widget child, List<Color>? color) {
  Gradient _shimmerGradient = LinearGradient(
    colors:
        color ??
        const [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
    stops: const [0.1, 0.3, 0.4],
    begin: const Alignment(-1.0, -0.3),
    end: const Alignment(1.0, 0.3),
    tileMode: TileMode.mirror,
  );
  return Shimmer(child: child, gradient: _shimmerGradient);
}

createContainer(
  double height,
  double width,
  borderRadius, {
  List<Color>? color,
}) {
  return createShimmerEffect(
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ColorName.colorHintText,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    color,
  );
}
