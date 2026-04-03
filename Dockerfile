FROM ethersphere/bee:latest

# Copy config template
COPY bee.yaml /home/bee/.bee.yaml

# Data directory lives on the persistent volume
VOLUME /data

EXPOSE 1633

# Entrypoint is already set by the base image.
# Config values can be overridden via env vars (BEE_ prefix).
# See: https://docs.ethswarm.org/docs/bee/working-with-bee/configuration
