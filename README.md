# swarmit-node

Bee light node (stock `ethersphere/bee:2.8.3`) shared by the Swarmit curator and other services, deployed with Coolify on the Hetzner server. (Originally packaged for Railway; the variables below still apply.)

Until 2.8.3 this repo built a patched Bee from source to work around a pusher deadlock (ethersphere/bee#5641). 2.8.3 includes the upstream fix (#5647), so the patch is gone; see git history if you need it.

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
