plugins {
    id("com.android.application")
    id("kotlin-android")
}

android {
    namespace = "ru.legalassistant.app"
    compileSdk = 34

    ndkVersion = "27.0.12077973"  // ← кавычки обязательны!

    defaultConfig {
        applicationId = "ru.legalassistant.app"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib")
}