FROM ethersphere/bee:latest

EXPOSE 1633

ENTRYPOINT ["bee"]
CMD [ \
  "start", \
  "--mainnet", \
  "--full-node=false", \
  "--storage-incentives-enable=false", \
  "--skip-postage-snapshot", \
  "--api-addr=0.0.0.0:1633", \
  "--resolver-options=https://cloudflare-eth.com", \
  "--cors-allowed-origins=*" \
]
