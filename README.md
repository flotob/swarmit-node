# swarmit-node

Bee light node for the Swarmit curator, packaged for Railway deployment.

## Railway Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `BEE_PASSWORD` | Yes | Keystore password |
| `BEE_BLOCKCHAIN_RPC_ENDPOINT` | Yes | Gnosis Chain RPC URL |

Bee supports env var overrides with the `BEE_` prefix — any config key in `bee.yaml` can be overridden. See [Bee configuration docs](https://docs.ethswarm.org/docs/bee/working-with-bee/configuration).

## Volume

Mount a persistent volume at `/data`. This holds keys, localstore, statestore (~700MB).

## Networking

The API listens on port `1633`. Within a Railway project, the curator connects via internal networking (e.g., `http://swarmit-node.railway.internal:1633`).
