# 10. Use Grafana Loki for External Logging

Date: 2024-09-08

## Status

Accepted

## Context

We need a solution to send logs outside the device for better monitoring and analysis. The solution should support different log levels, integrate easily with the chosen local logging tool (Timber), and provide a way to monitor the app's performance and errors remotely. Since I have prior experience using Splunk, we looked for an alternative that offers similar functionality with a free plan.

## Decision

We will use **Grafana Loki** as the external logging solution for this project.

This decision is based on the following criteria:
- **Cost-effective**: Grafana Loki is free and open-source, and we can use the Grafana Cloud free tier or self-host it for external logging.
- **Seamless Integration with Timber**: Grafana Loki can be integrated with Timber using custom trees, allowing us to send logs to the cloud.
- **Log aggregation**: Loki provides efficient log aggregation and monitoring capabilities, similar to Splunk, making it easier to track issues and analyze app performance.

## Consequences

- Pros:
  - **Cost-free**: Both the open-source version and the Grafana Cloud free plan offer enough functionality for a single user with a small app.
  - **Log Levels Support**: Loki works well with different log levels (Debug, Info, Warn, Error) and provides powerful filtering and search capabilities.
  - **Scalability**: As the app grows, Loki offers scalability for monitoring larger datasets if needed.
  - **Cloud Integration**: Using Grafana Cloud allows for hassle-free cloud-based log storage and analysis.

- Cons:
  - **Setup complexity**: Some additional setup is required to integrate Loki with Timber, especially if self-hosting is chosen.
  - **Requires an external service**: Cloud-based solutions introduce a dependency on internet connectivity for external logging, but local logging will still work when offline.