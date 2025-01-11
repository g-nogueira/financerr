# 2. Use Dart for Development

Date: 2025-01-11

## Status

Accepted

## Context

We need to choose a primary programming language for developing the app. The app is currently intended for web and Android, but there’s a possibility of adding an iOS version in the future.

The selected language should:

- Be well-supported in the Android ecosystem.
- Be easy to learn and maintain.
- Provide strong community and tooling support.
- Be interoperable with other Android tools and languages.
- Have future potential for cross-platform development.

## Decision

We will use **Dart** as the primary programming language for this project.

Dart, in combination with the Flutter framework, provides a robust solution for cross-platform development, allowing us to target web, Android, and potentially iOS from a single codebase. Dart offers modern language features, strong performance, and a growing ecosystem.

## Consequences

- **Pros:**
  - **Cross-Platform Development**: Dart with Flutter allows us to develop for web, Android, and potentially iOS from a single codebase, reducing development time and effort.
  - **Modern Language Features**: Dart provides features like strong typing, async/await for asynchronous programming, and a rich standard library.
  - **Strong Community and Tooling**: Flutter has a strong community and excellent tooling support, making it easier to develop, test, and deploy applications.
  - **Performance**: Dart compiles to native code, providing high performance for mobile applications.

- **Cons:**
  - **Learning Curve**: There is a learning curve associated with Dart and Flutter, especially for developers familiar with Kotlin and Android development.
  - **Ecosystem Maturity**: While growing rapidly, the Dart and Flutter ecosystem is still newer compared to Kotlin and the Android ecosystem.
  - **Interoperability**: Existing Java or Kotlin code and libraries may require additional effort to integrate with Dart and Flutter.