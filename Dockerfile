# Stock Bee v2.8.3. v2.8.3 ships the upstream fix for the pusher deadlock we
# used to patch ourselves (ethersphere/bee#5641, fixed by #5647), plus security
# fixes (SOC verification on pushsync, joiner bounds checks), so we're back on
# the official image and no longer build from source. The postage snapshot is
# no longer skipped: on an empty batch store Bee loads its bundled snapshot
# instead of scanning the chain from the public RPC 1000 blocks at a time.
FROM ethersphere/bee:2.8.3

EXPOSE 1633

ENTRYPOINT ["bee"]
CMD [ \
  "start", \
  "--mainnet", \
  "--full-node=false", \
  "--swap-enable=true", \
  "--storage-incentives-enable=false", \
  "--api-addr=0.0.0.0:1633", \
  "--blockchain-rpc-endpoint=https://rpc.gnosischain.com", \
  "--resolver-options=https://cloudflare-eth.com", \
  "--cors-allowed-origins=*" \
]
