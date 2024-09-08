# 9. Use Timber for Error Handling and Local Logging

Date: 2024-09-08

## Status

Accepted

## Context

We need a logging solution that can efficiently handle error tracking and logging within the app. Since I am the sole developer and new to mobile development, I need a tool that is simple to implement, offers flexibility in log levels (Debug, Info, Warn, Error, etc.), and works seamlessly with try-catch blocks for custom exception handling.

## Decision

We will use **Timber** for local logging and error handling.

This decision is based on the following criteria:
- **Ease of use**: Timber is simple to integrate and requires minimal boilerplate code, which is ideal for a single developer.
- **Flexible logging**: Timber supports multiple log levels and offers flexibility in logging messages at different verbosity levels, making it easier to track and debug the app.
- **Try-Catch Integration**: Timber integrates well with custom exception handling, allowing us to track errors effectively within the app.

## Consequences

- Pros:
  - **Simplicity**: Timber is easy to use and lightweight, making it well-suited for a solo developer.
  - **Log levels**: Built-in support for logging with different verbosity levels (Debug, Info, Warn, Error, etc.).
  - **Minimal boilerplate**: It reduces the amount of code needed compared to other logging libraries.
  - **Expandable**: We can later extend Timber to log to external systems or services like Grafana Loki for cloud-based monitoring.

- Cons:
  - **Local-only by default**: Timber does not natively support external logging, but we can extend it with custom trees to enable cloud logging in the future.