# 2. Use Kotlin for Development

Date: 2024-09-07

## Status

Accepted

## Context

We need to choose a primary programming language for developing the mobile app. The app is currently intended for Android, but there’s a possibility of adding web and iOS versions in the future.

The selected language should:

- Be well-supported in the Android ecosystem.
- Be easy to learn and maintain.
- Provide strong community and tooling support.
- Be interoperable with other Android tools and languages.
- Have future potential for cross-platform development.

## Decision

We will use **Kotlin** as the primary programming language for this project.

Kotlin is the official language for Android development and provides modern features like null safety, coroutines for asynchronous programming, and strong Java interoperability.

Although adding web and iOS apps in the future is a possibility, Kotlin remains a strong candidate due to:
- Potential for cross-platform development with **Kotlin Multiplatform**.
- Interoperability with Java, making it easier to integrate existing Java code or libraries.

## Consequences

- **Pros:**
  - Kotlin’s modern language features will make the code more concise, safe, and easy to maintain.
  - The strong support for Kotlin in the Android ecosystem ensures future compatibility and community backing.
  - Kotlin’s Java interoperability will allow seamless integration with existing Java tools, libraries, and APIs.
  - If needed in the future, Kotlin Multiplatform offers a path for code sharing between Android, iOS, and web.

- **Cons:**
  - Learning curve for a new language.
  - If iOS and web versions are developed in the future, separate frameworks may still be needed unless adopting **Kotlin Multiplatform**.
