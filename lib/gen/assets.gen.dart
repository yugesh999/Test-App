// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $LibGen {
  const $LibGen();

  /// Directory path: lib/shared
  $LibSharedGen get shared => const $LibSharedGen();
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/svg/delete.svg');

  /// File path: assets/svg/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/svg/edit.svg');

  /// File path: assets/svg/ic_arrow_forward.svg
  SvgGenImage get icArrowForward =>
      const SvgGenImage('assets/svg/ic_arrow_forward.svg');

  /// File path: assets/svg/ic_correct_check.svg
  SvgGenImage get icCorrectCheck =>
      const SvgGenImage('assets/svg/ic_correct_check.svg');

  /// File path: assets/svg/ic_email_icon.svg
  SvgGenImage get icEmailIcon =>
      const SvgGenImage('assets/svg/ic_email_icon.svg');

  /// File path: assets/svg/ic_error.svg
  SvgGenImage get icError => const SvgGenImage('assets/svg/ic_error.svg');

  /// File path: assets/svg/ic_footer.svg
  SvgGenImage get icFooter => const SvgGenImage('assets/svg/ic_footer.svg');

  /// File path: assets/svg/ic_incorrect_check.svg
  SvgGenImage get icIncorrectCheck =>
      const SvgGenImage('assets/svg/ic_incorrect_check.svg');

  /// File path: assets/svg/ic_logout.svg
  SvgGenImage get icLogout => const SvgGenImage('assets/svg/ic_logout.svg');

  /// File path: assets/svg/ic_logout_logo.svg
  SvgGenImage get icLogoutLogo =>
      const SvgGenImage('assets/svg/ic_logout_logo.svg');

  /// File path: assets/svg/ic_no_internet.svg
  SvgGenImage get icNoInternet =>
      const SvgGenImage('assets/svg/ic_no_internet.svg');

  /// File path: assets/svg/ic_something_went_wrong.svg
  SvgGenImage get icSomethingWentWrong =>
      const SvgGenImage('assets/svg/ic_something_went_wrong.svg');

  /// File path: assets/svg/ic_success.svg
  SvgGenImage get icSuccess => const SvgGenImage('assets/svg/ic_success.svg');

  /// File path: assets/svg/ic_uncheck.svg
  SvgGenImage get icUncheck => const SvgGenImage('assets/svg/ic_uncheck.svg');

  /// File path: assets/svg/splash_logo.svg
  SvgGenImage get splashLogo => const SvgGenImage('assets/svg/splash_logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    delete,
    edit,
    icArrowForward,
    icCorrectCheck,
    icEmailIcon,
    icError,
    icFooter,
    icIncorrectCheck,
    icLogout,
    icLogoutLogo,
    icNoInternet,
    icSomethingWentWrong,
    icSuccess,
    icUncheck,
    splashLogo,
  ];
}

class $LibSharedGen {
  const $LibSharedGen();

  /// Directory path: lib/shared/lang
  $LibSharedLangGen get lang => const $LibSharedLangGen();
}

class $LibSharedLangGen {
  const $LibSharedLangGen();

  /// File path: lib/shared/lang/en.json
  String get en => 'lib/shared/lang/en.json';

  /// List of all assets
  List<String> get values => [en];
}

class Assets {
  const Assets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $LibGen lib = $LibGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
