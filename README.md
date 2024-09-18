# Hystero-Vision


## Project Overview
The Hystero-Vision is a flutter based application which is a simple and user-friendly tool designed for gynecologists to label hysteroscopy frames efficiently. Its primary objective is to collect medically validated hysteroscopy data of the female reproductive system to develop AI models for detecting abnormalities. By automating the annotation process in real-time, the application saves time and generates a large, annotated dataset, facilitating the development of robust Artificial Intelligence (AI) models for abnormality classification in both routine and clinical settings.

The application consisted of a secure login system, profle setup, and the testing module. 

For each hysteroscopy frame, there are 2 questions i.e., Identify the part of organ in this image from the following and assign an appropriate label to the image from the following, Any comment related to the image. For each of the question, multiple options were given to the users.

In the first question, the four options were: `Vagina`, `Cervical canal`,`Endometrium cavity`, `Ectocervix`. 
The second question had thirty four options that were `Fibroid Base / Myometrium`, `Submucus fibroid`, `Ostium`, `Septum`, `Polyp`, `Normal endometrium cavity`, `Normal endocervical cavity`, `Endocervical canal`, `Thicken endometrium`, `Fundus`, `Normal Ectocervix`, `Abnormal Ectocervix`, `Air bubble`, `Fluid with debris`, `Sheath`, `Loop`, `Scissors`, `IUCD`, `Poor vision`. Additionally, there is a third question where the user can input any other comment related to the frame.

In the back-end, time taken to analyse each frame is recorded and for each selection in any of questions, a numeric ‘1’ is assigned. Rest of the non-selected options were assigned a numeric ‘0’. In this manner, each ultrasound frame were assigned different labels and values for different values of total 23 options. This assignment was done by the inspiration of one-hot encoding method. It is a method used to convert categorical values to binary value of ‘0’ or ‘1’. All this data was saved in real-time in the form of an excel sheet at the application’s back-end. The sheet stores were—**(1) option selected for each of the question(multiples options for question 1 and 2), (2) any comment added by user, (3) email ID.**

## Hystero-Vision Application Manual
The **Hystero-Vision Application Manual** is a comprehensive guide designed to help users understand the functionality of the Hystero-Vision app. It provides detailed instructions on how to navigate the app, use its various features, and effectively score label utrasound frames. The manual is essential for both new users and those looking to maximize the app's potential. To access the manual, please refer to the documentation included in the repository by the name of Hystero-Vision Application Manual.

## Getting Started
These instructions will guide you through setting up and running the app on your local machine.

### Prerequisites
- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter
- Android Studio or Xcode: For running the app on an emulator or physical device
- Firebase account: For backend services

### Installation 
#### (run these commands in the terminal)
1. Clone the repository:
    ```bash
    git clone https://github.com/misahub2023/FEM-LABELLER.git
    ```
2. Update flutter and its dependencies: 
    ```bash
    flutter upgrade
    ``` 
3. Check whether flutter is ready for use: 
    ```bash
    flutter doctor
    ```
    Resolve any issues shown by flutter doctor before moving to next steps

4. Install the dependencies:
    ```bash
    flutter pub get
    ```

### Google Sheets Setup
1. Create a project in Google Cloud and enable the Google Sheets API.
2. Download the JSON credentials file for a service account and replace the placeholders in the `credentials` field with your actual credentials in `lib/services/sheet.dart`.
3. Create a new Google Spreadsheet and share it with the service account email (client_email from the `credentials`).
4. Copy the spreadsheet ID from the URL and replace the placeholder in `spreadsheetId` with your actual spreadsheet ID in `lib/services/sheet.dart`.

### Firebase Setup
1. Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project.
2. Add an Android app to your Firebase project. Download the `google-services.json` file and place it in the `android/app` directory. A sample of the json file is already in the directory.
3. Add an iOS app to your Firebase project. Download the `GoogleService-Info.plist` file and place it in the `ios/Runner` directory and also update `ios/firebase_app_id_file.json`. A sample of the both the files could be found in the mentioned directory.
4. Modify the `pubspec.yaml` file to include the necessary Firebase dependencies:
    ```yaml
    dependencies:
      firebase_core: latest_version
      firebase_auth: latest_version
      cloud_firestore: latest_version
    ```

### Running the App
1. Connect your device or start an emulator.
2. Run the app:
    ```bash
    flutter run
    ```
## Files Structure And their purpose
+ android/
    + [app/](android/app) 
        + `src/` (Source files for different build variants)
            + `debug/` 
                + `AndroidManifest.xml` (The manifest file for the debug build variant, specifying application metadata, permissions, and components)
            + `main/` (Source files for the main build variant)
                + `kotlin/com/example/ultasound/`
                    + `MainActivity.kt` (The main entry point for the Android application written in Kotlin)
                + `res/` (Resource files for the app, one can modify the launch screeen backgroud using multiple options available in this folder)
                    + `drawable-v21/` (Drawable resources for API level 21 and above, one can modify the launch screeen backgroud using multiple options available in this directory)
                        + `launch_background.xml` (Defines the launch screen background for the app)
                    + `values-night/` 
                        + `styles.xml` (Defines styles for the app in night mode)
                    + `values/`
                        + `styles.xml` (Defines styles for the app)
                + `AndroidManifest.xml` (The manifest file for the main build variant, specifying application metadata, permissions, and components)
            + `profile` (Source files for the profile build variant)
                + `AndroidManifest.xml`
        + `build.gradle` (Build configuration file for the app module, specifying dependencies, plugins, and build settings)
        + `google-services.json` (Configuration file for Firebase, containing API keys and project identifiers)
    + [gradle/wrapper/](android/gradle/wrapper) (Contains Gradle wrapper files to ensure a specific version of Gradle is used)
        + `gradle-wrapper.properties` (Specifies properties for the Gradle wrapper, such as the Gradle distribution URL)
    + [build.gradle](android/build.gradle) (Top-level build configuration file for the project, specifying project-wide dependencies and build settings)
    + [gradle.properties](android/gradle.properties) (Specifies properties for the Gradle build system, such as JVM options and project properties)
    + [ultrasound_android.iml](android/ultasound_android.iml) (IntelliJ IDEA module file for the project)
    + `[settings.gradle](android/settings.gradle) (Specifies the Gradle settings for the project, including module names and build configurations)

+ ios/
    + [Flutter/](ios/Flutter) (This folder contains Flutter-specific files that are automatically generated and managed by the Flutter framework)
        + `AppFrameworkInfo.plist` (contains metadata about the Flutter framework)
    + [Runner.xcodeproj/](ios/Runner.xcodeproj) (This folder contains the Xcode project files for your IOS app)
        + `project.pbxproj` (project file that describes the targets, build configurations, and file references for your Xcode project)
    +  [Runner.xcworkspace/](ios/Runner.xcworkspace) (This folder contains the workspace settings for your Xcode project)
        + `contents.xcworkspacedata.xml` (ile defines the structure of your Xcode workspace, including references to your project and any dependencies)
    + [Runner/](ios/Runner) (This folder contains the main iOS project files, including the app's source code, assets, and configurations)
        + `Assets.xcassets/` (This folder contains the app's image assets, such as icons and launch images)
            + `AppIcon.appiconset/`
                +  `Contents.json` (A JSON file that describes the structure and properties of the icon set)
            + LaunchImage.imageset/
                +  `Contents.json` (A JSON file that describes the structure and properties of the launch image set)
                + `README.md` (explains steps to modify the launch screen)
        + `Base.lproj/` (This folder contains the storyboard files for the app's user interface)
            + `LaunchScreen.storyboard.xml` (defines the layout and properties of the app's launch screen)
            + `Main.storyboard.xml` (defines the layout and properties of the app's main interface)
        + `AppDelegate.swift` (This file contains the entry point for the iOS app and handles app lifecycle events)
        + `GoogleService-Info.plist` (This file contains configuration information for Firebase, including API keys and project identifiers)
        + `Info.plist` (contains configuration settings for the iOS app, such as app permissions, icons, and other metadata)
    + [Podfile](ios/Podfile) (This file is used by CocoaPods to manage your app's dependencies)
    + [firebase_app_id_file.json](ios/firebase_app_id_file.json) (This file contains your Firebase project configuration, including your Firebase app ID and other settings)
+ [assets/](assets) (This folder contains images used in the app) 
+ lib/
    + [auth/](lib/auth) (Contains authentication-related screens and logic)
    + [models/](lib/model) (Data models used across the app)
    + [screen/](lib/screen) (Contains the primary screens of the app)
    + [services/](lib/services) (Backend services and API handling)
    + [utils/](lib/utils) (Utility functions and widgets)
    + [firebase_options.dart](lib/firebase_options.dart) (Configuration file for Firebase initialization and setup)
    + [main.dart](lib/main.dart) (The entry point of the Flutter application)
+ test/
    + [widget_test.dart](test/widget_test.dart) (File for testing the widgets of the app)

#### This application is developed for android devices so for IOS supported app, one must modify the files in `ios` folder according to the details of each file mentioned above.
## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add your feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

