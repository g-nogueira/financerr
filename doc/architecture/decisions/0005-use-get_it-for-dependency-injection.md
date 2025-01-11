# 5. Use get_it for Dependency Injection

Date: 2025-01-11

## Status

Accepted

## Context

We need a Dependency Injection (DI) framework to manage object creation and lifecycle within the app. The DI framework should:
- Be easy to use and integrate into Flutter architecture components.
- Require minimal boilerplate code and setup.
- Offer compile-time validation for dependency graphs.
- Be future-proof for potential app expansions.

## Decision

We will use **get_it** for dependency injection, as it is a popular DI solution for Flutter.

get_it simplifies DI setup and works well with Flutter components like Provider and Riverpod.

## Consequences

- **Pros:**
  - **Automatic Code Generation**: get_it handles the generation of DI components, reducing manual effort.
  - **Integration with Flutter Components**: get_it works seamlessly with Flutter’s lifecycle components (e.g., Widgets).
  - **Scalability**: get_it supports scoped dependencies, enabling efficient memory management.
  - **Compile-Time Checks**: Dependency graphs are validated at compile time, reducing runtime errors.

- **Cons:**
  - **Limited Fine Control**: Abstracts some lower-level configurations, which may not be ideal for highly customized DI needs.
  - **Learning Curve**: Although easier than Dagger, it still requires some learning.