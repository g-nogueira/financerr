# 5. Use Hilt for Dependency Injection

Date: 2024-09-07

## Status

Accepted

## Context

We need a Dependency Injection (DI) framework to manage object creation and lifecycle within the app. The DI framework should:
- Be easy to use and integrate into Android architecture components.
- Require minimal boilerplate code and setup.
- Offer compile-time validation for dependency graphs.
- Be future-proof for potential app expansions.

## Decision

We will use **Hilt** for dependency injection, as it is the official DI solution for Android, built on top of Dagger.

Hilt simplifies DI setup and works well with Android components like ViewModel and WorkManager.

## Consequences

- **Pros:**
  - **Automatic Code Generation**: Hilt handles the generation of DI components, reducing manual effort.
  - **Integration with Android Components**: Hilt works seamlessly with Android’s lifecycle components (e.g., Activities, Fragments).
  - **Scalability**: Hilt supports scoped dependencies, enabling efficient memory management.
  - **Compile-Time Checks**: Dependency graphs are validated at compile time, reducing runtime errors.

- **Cons:**
  - **Limited Fine Control**: Abstracts some lower-level configurations, which may not be ideal for highly customized DI needs.
  - **Learning Curve**: Although easier than Dagger, it still requires some learning.