FROM ethersphere/bee:latest

# Copy config template
COPY bee.yaml /home/bee/.bee.yaml

EXPOSE 1633

CMD ["start"]
