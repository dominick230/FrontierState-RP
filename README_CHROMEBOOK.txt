FRONTIER STATE RP — GODOT ANDROID PROTOTYPE

This is a rebuilt, non-Unity prototype intended for Android/Chromebook testing.

WHAT IT INCLUDES
- Frontier State RP branding/login/create-account flow
- Character selection
- Region selection
- 8 Frontier State server entries (FS-01 through FS-08)
- Server browser with player counts and ping placeholders
- Basic two-city Frontier State prototype map
- Highway connecting the cities
- Police, hospital, bank, and military-base map markers
- Basic keyboard movement for Chromebook
- Touch-oriented on-screen joystick visual
- Single APK-oriented Godot project structure

IMPORTANT
This is a playable prototype, not the complete production MMO.
Real 700-player networking, authentication servers, database persistence,
voice, anti-cheat, economy validation, police systems, and dedicated servers
still need backend implementation and load testing.

CHROMEBOOK BUILD
1. Enable ChromeOS Linux:
   Settings > Advanced > Developers > Linux development environment.
2. Install Godot 4.x for Linux (use the Godot Linux build appropriate for
   your Chromebook CPU).
3. Extract this ZIP.
4. Open the project.godot file in Godot.
5. Run the project to test it.
6. For Android export, install/configure the Android SDK/JDK in Godot's
   Editor Settings and install the Android export templates.
7. Project > Export > Android > Export Project.
8. Install the resulting APK on an Android phone.

If your Chromebook is ARM64, download the ARM64 Linux build of Godot.
If it is Intel/AMD x86_64, use the x86_64 build.

The project uses Godot's Compatibility renderer to keep the prototype
friendlier to lower-powered/mobile hardware.

NO-GODOT OPTION — CLOUD APK BUILD
If you cannot run Godot on your Chromebook, this package now includes:
- export_presets.cfg
- .github/workflows/android-apk.yml
- BUILD_APK_WITHOUT_GODOT.txt

Use GitHub Actions to compile the Android APK in the cloud. You only need a
browser and a GitHub account; you do not need Unity Hub or Godot installed.
See BUILD_APK_WITHOUT_GODOT.txt for the exact steps.
