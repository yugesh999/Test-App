plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}
android {

    lint {
        checkReleaseBuilds = false
    }
    sourceSets {
        getByName("main") {
            java.srcDirs("src/main/kotlin")
        }
    }
    compileSdk = 36

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        namespace = "com.myweather.app" // ← Add this line

        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.myweather.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.0"
        multiDexEnabled = true
    }

    applicationVariants.all {
        val variant = this
        variant.outputs.all {
            val output = this as com.android.build.gradle.internal.api.BaseVariantOutputImpl
            var newName = output.outputFileName

            // Example: Rename APK to include variant name, version, and date
            if (newName.contains("release")) {
                newName =
                    "MyWeather App-${variant.versionName}-${variant.name}.apk"
            } else {
                newName = "MyWeather App-${variant.versionName}-${variant.name}-debug.apk"
            }

            output.outputFileName = newName
        }
    }

    buildFeatures {
        buildConfig = true // ← Enable BuildConfig generation
    }
    flavorDimensions += "tier"
    productFlavors {
        create("uat") {
            dimension = "tier"
            buildConfigField("String", "BASE_URL", "\"https://uat-graphql.kuostats.com\"")
            buildConfigField("String", "DOMAIN", "\"uat\"")
            resValue("string", "app_name", "Alpinist HR UAT")
            versionCode = 1
            versionName = "1.0.0"
        }

        create("qa") {
            dimension = "tier"
            buildConfigField("String", "BASE_URL", "\"https://uat-graphql.kuostats.com\"")
            buildConfigField("String", "DOMAIN", "\"qa\"")
            resValue("string", "app_name", "Alpinist HR QA")
            versionCode = 1
            versionName = "1.0.0"
        }
        create("dev") {
            dimension = "tier"
            buildConfigField(
                "String",
                "BASE_URL",
//                "\"https://6062f45c-9096-41b2-bb5c-cede6d7cbae1.mock.pstmn.io/api/v1\""
                "\"https://hr.soanitech.com/api/v1\""
            )
            buildConfigField("String", "DOMAIN", "\"dev\"")
            resValue("string", "app_name", "Weather App")
            versionCode = 1
            versionName = "1.0.0"
        }
        create("live") {
            dimension = "tier"
            buildConfigField("String", "BASE_URL", "\"https://uat-graphql.kuostats.com\"")
            buildConfigField("String", "DOMAIN", "\"live\"")
            resValue("string", "app_name", "Alpinist HR")
            versionCode = 1
            versionName = "1.0.0"
        }
    }


    buildTypes {
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug") // Replace with release config
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
        }
    }
}
dependencies {
}

flutter {
    source = "../.."
}
