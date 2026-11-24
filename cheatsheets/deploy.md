# deploy

> Inspecting and rolling back a service on Kubernetes; `[svc]` is the deployment name.

# Getting started

- `kubectl config get-contexts` - clusters you can reach
- `kubectl config use-context [name]` - pick a cluster
- `kubectl get deploy [svc] -n [namespace]` - health of the service

# Inspect

- `kubectl rollout history deploy/[svc]` - revisions of the deployment
- `kubectl rollout status deploy/[svc]` - watch a rollout finish
- `kubectl describe pod [pod]` - events, probes and restarts
- `kubectl get pods -o wide` - pods and their nodes

# Roll back

- `kubectl rollout undo deploy/[svc]` - back to the previous revision
- `kubectl rollout undo deploy/[svc] --to-revision=[n]` - back to a named revision
- `kubectl rollout restart deploy/[svc]` - restart the pods in turn

# Notes

- A rollback is a stopgap; the fix is a revert PR, and an older image does not undo database migrations

# See also

- `cheat observability` - metrics, logs and traces
- `cheat bazel` - build and run the service locally
- `cheat git` - revert and push flow
