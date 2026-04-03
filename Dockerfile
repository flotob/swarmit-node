FROM ethersphere/bee:latest

COPY bee.yaml /home/bee/.bee.yaml

USER root

EXPOSE 1633

ENTRYPOINT ["bee"]
CMD ["start"]
