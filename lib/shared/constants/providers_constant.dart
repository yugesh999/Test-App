import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> listOfProviders = [
    Provider(create: (context) => AuthStore()),
  ];
}

class AuthStore {
}
