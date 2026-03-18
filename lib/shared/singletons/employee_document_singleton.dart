class EmployeeDocumentSingleton {
  static EmployeeDocumentSingleton? _instance;

  EmployeeDocumentSingleton._();

  static EmployeeDocumentSingleton get getInstance =>
      _instance ??= EmployeeDocumentSingleton._();

  String navigateFrom = "";
  bool isProfileSet = false;

  setNavigateFrom(String navigateFrom) {
    this.navigateFrom = navigateFrom;
  }

  String getNavigateFrom() {
    return navigateFrom;
  }

  setIsProfileSet(bool isProfileSet) {
    this.isProfileSet = isProfileSet;
  }

  bool getIsProfileSet() {
    return isProfileSet;
  }
}
