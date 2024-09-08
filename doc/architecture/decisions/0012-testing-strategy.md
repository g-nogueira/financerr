# 12. Testing Strategy

Date: 2024-09-08

## Status

Accepted

## Context

To ensure the quality and reliability of the app, we need to define a comprehensive testing strategy. The strategy should cover various aspects of testing, including functionality, performance, and user experience. The goal is to balance automated and manual testing methods to achieve thorough coverage while remaining manageable for a single developer.

## Decision

We will implement the following testing strategy:

1. **Unit Testing**: 
   - **Tools**: JUnit, Mockito
   - **Why**: JUnit provides a standard framework for writing and running unit tests, while Mockito allows for mocking dependencies, making it easier to isolate the unit under test.

2. **Integration Testing**: 
   - **Tools**: JUnit, Espresso
   - **Why**: Integration testing will be conducted using JUnit for running the tests and Espresso for testing UI components and interactions to ensure modules work together as expected.

3. **UI Testing**: 
   - **Tools**: Espresso, Jetpack Compose Testing
   - **Why**: Espresso is used for traditional UI testing, while Jetpack Compose Testing is used to test UI components created with Jetpack Compose.

4. **End-to-End Testing**: 
   - **Tools**: Espresso, Robolectric
   - **Why**: Espresso will be used for end-to-end testing of user interactions, and Robolectric allows for running Android tests on the JVM, which speeds up the testing process.

5. **Performance Testing**: 
   - **Tools**: Android Studio Profiler
   - **Why**: Android Studio Profiler provides built-in tools to monitor and optimize performance, even though performance is not a primary concern for this small app.

6. **Automated Regression Testing**: 
   - **Tools**: JUnit, Espresso, GitHub Actions
   - **Why**: Automated regression testing will use JUnit and Espresso for running tests, with GitHub Actions set up for continuous integration to automate the testing process.

7. **Exploratory Testing**: 
   - **Tools**: Manual Testing
   - **Why**: Manual exploratory testing will be conducted to discover issues not covered by automated tests and to provide a more intuitive understanding of the app’s behavior.

8. **CI/CD**: 
   - **Tools**: GitHub Actions
   - **Why**: GitHub Actions will be used for automated build, test, and deployment processes to improve development efficiency and reduce the risk of errors.

## Consequences

- Pros:
  - **Comprehensive Coverage**: The strategy covers various aspects of testing, ensuring that the app is thoroughly tested.
  - **Early Bug Detection**: Unit and integration testing help catch issues early in the development cycle.
  - **Enhanced Reliability**: Automated regression testing and CI/CD ensure that new changes do not introduce new bugs and streamline the development process.
  - **Improved User Experience**: UI and end-to-end testing ensure that the app functions correctly from the user's perspective.
  - **Balanced Approach**: Combines automated and manual testing methods, making it manageable for a single developer.

- Cons:
  - **Initial Setup Effort**: Setting up the testing framework and writing tests may require an initial time investment.
  - **Maintenance Overhead**: Maintaining tests, especially automated ones, can require ongoing effort as the app evolves.
  - **Complexity for Small Changes**: Automated testing and CI/CD processes may add some complexity, but this is outweighed by the benefits for maintaining app quality.