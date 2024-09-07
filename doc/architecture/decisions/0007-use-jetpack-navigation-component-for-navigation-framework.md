# 7. Use Jetpack Navigation Component for Navigation Framework

Date: 2024-09-07

## Status

Accepted

## Context

We need to choose a navigation framework for managing transitions between screens in the Android app. The solution should be simple, provide type safety, support deep linking, and work well with our architecture (MVVM) and UI framework (Jetpack Compose).

## Decision

We will use the **Jetpack Navigation Component** as the navigation framework for this project.

This decision is based on the following criteria:
- **Simplicity**: It requires less boilerplate and manual work compared to managing navigation manually with `Intent` or `FragmentTransaction`.
- **Type Safety**: It provides compile-time checks by generating safe arguments when passing data between screens, which is important for ensuring a reliable app.
- **Graph-based Visualization**: It provides a centralized navigation graph, which helps with maintainability and clarity about the app's navigation flow.
- **Deep Linking Support**: Since the app is planned to be extensible, Jetpack Navigation's built-in deep linking makes it easier to implement future features, such as integrating with external apps or handling URLs.
- **Compatibility with Jetpack Compose**: It works well with our chosen UI framework, Jetpack Compose, ensuring smooth navigation transitions and composable integration.

## Consequences

### Pros:
- **Simplicity**: Provides a high level of abstraction, reducing the complexity of managing the back stack and transitions manually.
- **Type Safety**: Generates type-safe arguments for passing data between screens, leading to more reliable code.
- **Built-in Features**: It has built-in support for managing the back stack, animations, and transitions, and allows easy handling of deep linking.
- **Modern & Scalable**: Works seamlessly with Jetpack Compose and can scale well as the app grows in complexity.
- **Extensibility**: Deep linking capabilities make it easier to handle future features like external navigation.

### Cons:
- **Learning Curve**: Requires learning the navigation graph XML structure, which may add some initial complexity.
- **Less Customizable**: For advanced, highly customized navigation flows, this framework could feel more restrictive than a fully manual solution.
- **Overhead for Simple Apps**: For very simple apps, the full power of the Jetpack Navigation Component may be overkill, but given the potential extensibility of this app, this is acceptable.