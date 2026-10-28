# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project state

`fishing_log` is a freshly generated Flutter app (Dart SDK ^3.13.7). `lib/main.dart` and `test/widget_test.dart` are still the default counter template; there are no app dependencies beyond `cupertino_icons` yet.

The intended product is a Fishing Log MVP: record fishing sessions (GPS location, photos, fish species, bait, rig, results), fetch weather automatically from Open-Meteo, and browse history. The MVP spec lives in `docs/SPEC.md` (scope, packages: Riverpod + Drift + dio/geolocator/image_picker, feature-first folder layout, data model, Open-Meteo integration, build order). Follow it when adding features and update it when decisions change.

## Commands

```sh
flutter pub get                         # install dependencies
flutter run                             # run on connected device/emulator
flutter analyze                         # lint (flutter_lints via analysis_options.yaml)
flutter test                            # all tests
flutter test test/widget_test.dart      # single file
flutter test --plain-name "<test name>" # single test by name
```

If code generation is added later (e.g. riverpod/drift/freezed), run `dart run build_runner build --delete-conflicting-outputs` after changing annotated files.

## Notes

- `analysis_options.yaml` excludes the platform folders (`android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/`) and `build/` from analysis.
- Primary targets are Android and iOS; platform permissions (location, camera, photos) must be declared in `android/app/src/main/AndroidManifest.xml` and `ios/Runner/Info.plist` when those features are added.
