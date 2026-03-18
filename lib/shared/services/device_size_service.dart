
import '../../main.dart';
import '../constants/fonts/size_config.dart';

getHeight() {
  SizeConfig().init(navigatorKey.currentContext!);
  return SizeConfig.safeBlockVertical!;
}

getWidth() {
  SizeConfig().init(navigatorKey.currentContext!);
  return SizeConfig.safeBlockHorizontal!;
}
