import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../main.dart';
import '../services/device_size_service.dart';
import 'create_option_dialog.dart';

createNetworkImageItem(
  double height,
  double width,
  String imageUrl, {
  BoxFit fit = BoxFit.cover,
  double? borderRadius,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius ?? getHeight() * 0.8),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      progressIndicatorBuilder: (context, url, progress) {
        return createPlaceholderImage(height, borderRadius ?? 0);
      },
      errorWidget: (context, url, error) {
        return createPlaceholderImage(
          getHeight(),
          borderRadius ?? getHeight() * 0.9,
        );
      },
    ),
  );
}

createPlaceholderImage(double height, double borderRadius) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: Assets.svg.icSuccess.svg(fit: BoxFit.cover),
  );
}

createPlaceHolderImage(double height) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(height * 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 10),
      ),
      child: Assets.svg.icSuccess.svg(),
    ),
  );
}

userEditImageWidget(
  double width,
  double height,
  bool showBorder,
  String? avatarUrl,
  String? profileImage,
  Function? onClick, {
  String accessToken = "",
  bool showEdit = true,
}) {
  return SizedBox(
    height: getHeight() * 12.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: height,
          width: width,
          child:
              (avatarUrl != null && avatarUrl.isNotEmpty) ||
                      (profileImage != null && profileImage.isNotEmpty)
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(height * 10),
                    child:
                        profileImage!.isNotEmpty
                            ? Image.file(File(profileImage), fit: BoxFit.cover)
                            : CachedNetworkImage(
                              imageUrl: avatarUrl!,
                              height: height,
                              width: width,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (
                                context,
                                url,
                                progress,
                              ) {
                                return const CircularProgressIndicator();
                              },
                              errorWidget: (context, url, error) {
                                return createPlaceHolderImage(height);
                              },
                            ),
                  )
                  : createPlaceHolderImage(height),
        ),
        showEdit
            ? Positioned(
              bottom: 0,
              child: InkWell(
                onTap: () {
                  onClick!();
                },
                child: updateImageWidget(),
              ),
            )
            : const SizedBox.shrink(),
      ],
    ),
  );
}

updateImageWidget() {
  return Container(
    height: getHeight() * 3,
    width: getHeight() * 3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(getHeight() * 30)),
      color: ColorName.colorPrimary,
    ),
    child: Center(child: Assets.svg.icSuccess.svg()),
  );
}

Future<XFile?> compressImage(File file, int quality) async {
  final dir = await getTemporaryDirectory();
  String fileName = DateTime.now().toString();
  final targetPath = '${dir.absolute.path}/temp_$fileName.jpg';

  var result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: quality,
  );
  return result;
}

void showImageUpload(Function(String) onTap) async {
  return await showModalBottomSheet(
    isScrollControlled: true,
    context: navigatorKey.currentContext!,
    isDismissible: true,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CreateOptionDialog(
        onTap: (value) async {
          onTap(value);
        },
      );
    },
  );
}
