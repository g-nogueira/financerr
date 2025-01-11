# 4. Use sqflite for Local Database

Date: 2025-01-11

## Status

Accepted

## Context

We need a local database solution for the app to store and manage data. The database should integrate well with Flutter development, support offline usage, and be simple to use for a developer who is new to mobile development.

The chosen database should:
- Be easy to set up and integrate with the Flutter framework.
- Provide compile-time checks to ensure data consistency.
- Allow for potential future cloud sync if needed.
- Handle small to moderate amounts of data efficiently.

## Decision

We will use **sqflite** as the local database for the app. sqflite is a popular Flutter plugin that provides an abstraction layer over SQLite, simplifying database operations and ensuring compile-time checks.

**sqflite Details:**
- **Entities:** Define the data structure for the database tables.
- **DAO (Data Access Objects):** Provide methods to access and manipulate the data in the database.
- **Database:** Acts as the main access point for the underlying SQLite database and provides the DAOs.

## Consequences

- **Pros:**
  - **Ease of Use:** sqflite simplifies database interactions and integrates well with Flutter’s architecture components.
  - **Compile-Time Checks:** Ensures that SQL queries are verified at compile-time, reducing runtime errors.
  - **Integration with Provider:** Works well with Provider and ChangeNotifier for data observation and management.
  - **Future Cloud Sync:** Supports local-first strategies, allowing for future integration with cloud storage solutions like Firebase.

- **Cons:**
  - **Initial Learning Curve:** Some setup and configuration required, but manageable with modern Flutter documentation and tools.
  - **Not Ideal for Very Large Datasets:** While sqflite is suitable for small to moderate data volumes, it’s not designed for very large datasets or highly complex queries.