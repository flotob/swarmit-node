FROM ethersphere/bee:latest

# Copy config template
COPY bee.yaml /home/bee/.bee.yaml

EXPOSE 1633

# Entrypoint is already set by the base image.
# Config values can be overridden via env vars (BEE_ prefix).
# Persistent volume mounted at /data via Railway volumes.
# See: https://docs.ethswarm.org/docs/bee/working-with-bee/configuration
