# Bee v2.8.2 built from source with one patch (patches/): the pusher blocked
# forever on a queued chunk that is neither a valid CAC nor a SOC — it sent the
# error on a deferred op's nil Err channel (pkg/pusher/pusher.go chunksWorker)
# — so nothing was pushed again, across restarts and versions (2026-10-04,
# ~14h of every service's uploads stuck on this node). Unfixed upstream as of
# v2.8.2 / master. Go back to `FROM ethersphere/bee:<version>` once it is.
FROM golang:1.26 AS build
RUN git clone --depth 1 --branch v2.8.2 https://github.com/ethersphere/bee.git /src
WORKDIR /src
COPY patches/ /patches/
# -p=2 caps compile parallelism: the host has 4 GB RAM and runs other services.
RUN git apply /patches/*.patch && GOFLAGS=-p=2 make binary

FROM ethersphere/bee:2.8.2
COPY --from=build /src/dist/bee /usr/local/bin/bee

EXPOSE 1633

ENTRYPOINT ["bee"]
CMD [ \
  "start", \
  "--mainnet", \
  "--full-node=false", \
  "--swap-enable=true", \
  "--storage-incentives-enable=false", \
  "--skip-postage-snapshot", \
  "--api-addr=0.0.0.0:1633", \
  "--blockchain-rpc-endpoint=https://rpc.gnosischain.com", \
  "--resolver-options=https://cloudflare-eth.com", \
  "--cors-allowed-origins=*" \
]
