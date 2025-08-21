# Build APK Instructions

## Option 1: Install Android Studio (Recommended)
1. Download Android Studio: https://developer.android.com/studio
2. Install Android Studio and open it
3. Follow the setup wizard to install Android SDK
4. Set environment variables:
   - `ANDROID_HOME` = `C:\Users\[username]\AppData\Local\Android\Sdk`
   - Add to PATH: `%ANDROID_HOME%\platform-tools`
5. Run: `flutter build apk --release`
6. APK location: `build\app\outputs\flutter-apk\app-release.apk`

## Option 2: Use Docker (if you have Docker installed)
1. Install Docker Desktop for Windows
2. Run: `docker-build.bat`
3. APK will be at: `quotes-app.apk`

## Option 3: GitHub Actions (Push to GitHub)
1. Push this code to GitHub
2. GitHub Actions will automatically build APK
3. Download APK from Actions artifacts

## Option 4: Online Build Services
- Codemagic: https://codemagic.io
- AppCenter: https://appcenter.ms
- FlutterFlow: https://flutterflow.io