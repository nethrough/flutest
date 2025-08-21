@echo off
echo Building APK using Docker...

docker run --rm -v %cd%:/app -w /app cirrusci/flutter:stable sh -c "flutter pub get && flutter build apk --release"

if exist "build\app\outputs\flutter-apk\app-release.apk" (
    echo APK built successfully at: build\app\outputs\flutter-apk\app-release.apk
    copy "build\app\outputs\flutter-apk\app-release.apk" "quotes-app.apk"
    echo APK copied to: quotes-app.apk
) else (
    echo APK build failed
)

pause