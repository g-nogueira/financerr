# 3. Use MVVM Architecture

Date: 2024-09-07

## Status

Accepted

## Context

We need to choose an architectural pattern for the mobile app to ensure a clean, maintainable, and testable codebase. The app will include features like data persistence, UI updates based on data changes, and possibly future scalability considerations.

The chosen architecture should:
- Provide a clear separation of concerns.
- Facilitate easy testing of business logic.
- Integrate well with modern Android libraries and tools.
- Align with the developer's background and experience.

## Decision

We will use the **MVVM (Model-View-ViewModel)** architecture for the app. This decision is based on its alignment with our goals and its widespread adoption in the Android development community.

**MVVM Details:**
- **Model:** Represents the data and business logic. This includes data sources like Room and any network or database interactions.
- **View:** Represents the UI components (Activity/Fragment) and is responsible for rendering the data. It observes the ViewModel for changes.
- **ViewModel:** Acts as an intermediary between the View and the Model. It holds the data and business logic, and provides data to the View via LiveData or StateFlow.

## Consequences

- **Pros:**
  - **Separation of Concerns:** Clear separation between UI, business logic, and data layers promotes a more organized and maintainable codebase.
  - **Testability:** ViewModel and business logic can be tested independently of the UI.
  - **Lifecycle Awareness:** ViewModel persists data across configuration changes, avoiding unnecessary reloading of data.
  - **Reactive UI:** LiveData or StateFlow ensures that the UI stays up-to-date with changes in the underlying data.
  - **Familiarity:** Aligns with the developer’s experience in MVVM from .NET, making the development process smoother.

- **Cons:**
  - **Learning Curve:** Android-specific components like LiveData, ViewModel, and DataBinding may require some learning, though they integrate well with MVVM.
  - **Boilerplate Code:** May introduce additional boilerplate code, but this is manageable with modern libraries and Kotlin’s concise syntax.