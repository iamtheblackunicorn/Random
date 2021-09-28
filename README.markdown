<p align="center">
 <img src="https://github.com/iamtheblackunicorn/Random/raw/main/assets/images/banner.png"/>
</p>

# RANDOM :game_die:

*Let Fortuna decide for you!* :game_die:

## About :books:

I recently saw an episode of [***DanTDM's*** play-through of the game ***Lost in Random***](https://youtu.be/zyjdhzgMzsk) where dice play a crucial role.
I wanted to create an app that would give the user a virtual die. *Random* is that app. While this is highly experimental,
I always do my best to make things ***pretty*** and ***functional***. I hope you have fun! :heart: :unicorn:

## Download :inbox_tray:

- ***Fortuna*** (v.1.0.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Random/releases/download/v.1.0.0/Random-v1.0.0-Fortuna-Release.apk) (~15.2 MB)***
  - ***[Download for Mac OSX](https://github.com/iamtheblackunicorn/Random/releases/download/v.1.0.0/Random-v1.0.0-Fortuna-Release.app.zip) (~11.8 MB)***
- ***Tarot*** (v.2.0.0):
  - ***[Download for Android](https://github.com/iamtheblackunicorn/Random/releases/download/v.2.0.0/Random-v2.0.0-Tarot-Release.apk) (~15.3 MB)***
  - ***[Download for Mac OSX](https://github.com/iamtheblackunicorn/Random/releases/download/v.2.0.0/Random-v2.0.0-Tarot-Release.app.zip) (~13.2 MB)***

## Building :hammer:

Make sure that you have the following programmes installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
$ keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the Java keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *Random*.

## Changelog :black_nib:

### Version 1.0.0: ***Fortuna***

- upload to GitHub
- polishing of the logic
- minor fixes

### Version 2.0.0: ***Tarot***

- arming mechanics added
- arming colors added
- speed optimizations

## Note :scroll:

- *Random :game_die:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
