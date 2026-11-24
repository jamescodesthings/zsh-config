# observability

> Metrics, logs and traces for a service, built on Prometheus and OpenTelemetry with Grafana in front.

# Getting started

- `kubectl logs deploy/[service] -n [namespace] --since=30m` - quick look at a pod's log
- `kubectl logs -f [pod] -c [container]` - follow one container
- `kubectl top pod -n [namespace]` - CPU and memory per pod

# Metrics

- `rate(http_requests_total[5m])` - PromQL per-second request rate
- `histogram_quantile(0.99, sum by (le) (rate([name]_bucket[5m])))` - p99 latency
- `for: 10m` - Prometheus alert rule setting, how long a condition must hold before it fires

# Traces

- `OTEL_EXPORTER_OTLP_ENDPOINT` - where an OpenTelemetry SDK sends spans
- `OTEL_SERVICE_NAME` - the service name on its spans
- `http.status_code=404` - span attribute filter in a trace search

# Logs

- `gcloud logging read "resource.type=k8s_container AND severity>=ERROR" --limit=20` - recent errors
- `%X{trace_id}` - Logback MDC token, filled when the trace context is injected

# See also

- `cheat deploy` - kubectl and rollouts around a running service
- `cheat java` - Java tooling
- `cheat debugging` - profilers and debuggers
