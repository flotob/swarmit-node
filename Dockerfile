FROM ethersphere/bee:latest

USER root
COPY bee.yaml /root/.bee.yaml

EXPOSE 1633

ENTRYPOINT ["bee"]
CMD ["start"]
