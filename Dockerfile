FROM ethersphere/bee:latest

# Copy config template
COPY bee.yaml /home/bee/.bee.yaml

# Railway volumes mount as root — ensure the bee user can write to /data
USER root
RUN mkdir -p /data && chown -R bee:bee /data
USER bee

EXPOSE 1633

CMD ["start"]
