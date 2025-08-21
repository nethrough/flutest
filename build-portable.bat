@echo off
echo Setting up portable Android SDK...

if not exist "android-sdk" (
    echo Downloading Android SDK Command Line Tools...
    curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip
    powershell -command "Expand-Archive -Path cmdline-tools.zip -DestinationPath android-sdk"
    del cmdline-tools.zip
)

set ANDROID_HOME=%cd%\android-sdk
set PATH=%ANDROID_HOME%\cmdline-tools\bin;%PATH%

echo Installing SDK components...
echo y | sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"

echo Building APK...
flutter build apk --release

echo APK location: build\app\outputs\flutter-apk\app-release.apk
pause