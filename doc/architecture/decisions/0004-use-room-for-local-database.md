# 0004-use-room-for-local-database

Date: 2024-09-07

## Status

Accepted

## Context

We need a local database solution for the app to store and manage data. The database should integrate well with Android development, support offline usage, and be simple to use for a developer who is new to mobile development.

The chosen database should:
- Be easy to set up and integrate with the Android framework.
- Provide compile-time checks to ensure data consistency.
- Allow for potential future cloud sync if needed.
- Handle small to moderate amounts of data efficiently.

## Decision

We will use **Room** as the local database for the app. Room is part of the Android Jetpack suite of libraries and provides an abstraction layer over SQLite, simplifying database operations and ensuring compile-time checks.

**Room Details:**
- **Entities:** Define the data structure for the database tables.
- **DAO (Data Access Objects):** Provide methods to access and manipulate the data in the database.
- **Database:** Acts as the main access point for the underlying SQLite database and provides the DAOs.

## Consequences

- **Pros:**
  - **Ease of Use:** Room simplifies database interactions and integrates well with Android’s architecture components.
  - **Compile-Time Checks:** Ensures that SQL queries are verified at compile-time, reducing runtime errors.
  - **Integration with MVVM:** Works well with ViewModel and LiveData/StateFlow for data observation and management.
  - **Future Cloud Sync:** Supports local-first strategies, allowing for future integration with cloud storage solutions like Google Drive.

- **Cons:**
  - **Initial Learning Curve:** Some setup and configuration required, but manageable with modern Android documentation and tools.
  - **Not Ideal for Very Large Datasets:** While Room is suitable for small to moderate data volumes, it’s not designed for very large datasets or highly complex queries.