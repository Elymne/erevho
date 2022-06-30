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

## Vscode settings that can help

>

    {

        "search.exclude": {
            "**/*.g.dart": true,
            "**/*.freezed.dart": true,
            "**/*.gr.dart": true,
            "**/*.config.dart": true
        },

        "explorer.experimental.fileNesting.enabled": true,
        "explorer.experimental.fileNesting.expand": false,
        "explorer.experimental.fileNesting.patterns": {
            "pubspec.yaml": ".flutter-plugins, .packages, .dart_tool, .flutter-plugins-dependencies, .metadata, .packages, pubspec.lock, build.yaml, analysis_options.yaml, all_lint_rules.yaml",
            ".gitignore": ".gitattributes, .gitmodules, .gitmessage, .mailmap, .git-blame*",
            "readme.*": "authors, backers.md, changelog*, citation*, code_of_conduct.md, codeowners, contributing.md, contributors, copying, credits, governance.md, history.md, license*, maintainers, readme*, security.md, sponsors.md",
            "*.dart": "$(capture).g.dart, $(capture).freezed.dart, $(capture).gr.dart, $(capture).config.dart",
        },

    }
