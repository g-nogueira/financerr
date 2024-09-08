# 11. App Theming and Styling

Date: 2024-09-08

## Status

Accepted

## Context

We need to decide on the theming and styling for the app to ensure a consistent, modern, and user-friendly interface. The choices should align with current design trends while being easy to implement given the limited design resources available.

## Decision

We will use the following theming and styling approach for the app:

- **Material You**: If easy to add, Material You will be used to leverage its modern and adaptable design principles.
- **Primary, Secondary, and Accent Colors**: These colors will be used to ensure a clear and effective UX, focusing on important aspects of the interface.
- **Dark and Light Mode**: Both modes will be implemented to accommodate different user preferences and environments.
- **Default Styles and Fonts**: Default styles and fonts will be used for V1. These can be refined in V2 based on user feedback and further design considerations.
- **Round Corners and Cards**: To align with modern design trends and ensure a consistent look and feel.
- **Shadows**: No shadows will be used based on the design inspiration from NuBank, keeping the UI clean and minimalistic.
- **Animations**: Minimal or default animations will be used to avoid spending excessive time on UI nuances.

## Consequences

- Pros:
  - **Modern Design**: Material You and the use of round corners align with current design trends, making the app feel contemporary and user-friendly.
  - **Flexibility**: Dark and light mode support provides a better user experience in different lighting conditions.
  - **Simplicity**: Default styles and minimal animations reduce the development time and complexity.
  - **Consistency**: A focus on primary, secondary, and accent colors helps create a coherent and intuitive UI.

- Cons:
  - **Limited Customization**: Using default styles and minimal animations might limit the uniqueness of the app’s look and feel.
  - **Design Refinement**: Further design improvements might be necessary in V2 based on user feedback and evolving design trends.
  - **Potential Lack of Depth**: The absence of shadows may make the UI look less dynamic compared to apps that use more detailed design elements.