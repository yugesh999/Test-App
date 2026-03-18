# demo_project

A new Flutter project.

## Getting Started

Setup in Android Studio for Android
As the code has flavor for dev, uat, production, qa. For configuration for flavor on Android Studio
Please follow below steps:

- Click on the Run/Debug configuration
- If already main.dart configuration exist click on the edit configuration
- Edit the Dart Entry point to main.dart file path
- Add "--flavour dev" on Additional run args
- Add "dev" on Build Flavor

Setup in Xcode for iOS
As the code has flavor for dev, uat, production, qa. For configuration for flavor on XCode Please
follow below steps:

- On terminal, run the following command:"cd flutter_project_name/ios"
- And run the following command:"pod install"
- If already scheme edit the existing scheme
- It will open the scheme editor. And in the scheme editor for running the flavor dev select Run and
  Build Configuration choose Debug(Dev)
- select Test and Build Configuration choose Debug(Dev)
- select Test and Build Configuration choose Profile(Dev)
- select Analyze and Build Configuration choose Debug(Dev)
- select Archive and Build Configuration choose Release(Dev)

To generate apk according to flavor there are set of command on setup.sh file.
Here are the Example of command in setup.sh file which will be run on terminal:-

echo "dev debug"
flutter run --flavor dev

echo "dev release"
flutter run --flavor dev --release


