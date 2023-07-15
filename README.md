# erevho

A new Flutter project.
Just write what you were dreaming about and maybe share it anonymously with friend or the world.
(Project in progress and may not be completed because I'm lazy and this type of app may already exists).
(Alose, I use it to create a patchwork to implement Clean Architecture quickly).

## Getting Started

This project is a starting point for a Flutter application.
A few resources to get you started if this is your first Flutter project:

-   [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
-   [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project init

Run theses commands when you have cloned the project.

> flutter pub get

> flutter pub run build_runner build --delete-conflicting-outputs

> flutter gen-l10n

## Vscode settings that can help

>

    {

        "search.exclude": {
            "**/*.g.dart": true,
            "**/*.freezed.dart": true,
            "**/*.gr.dart": true,
            "**/*.config.dart": true
        },
        "files.exclude": {
            "**/*.g.dart": true,
            "**/*.freezed.dart": true,
            "**/*.gr.dart": true,
            "**/*.config.dart": true
        },

    }
