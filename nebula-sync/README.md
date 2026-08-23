# Nebula-Sync README

## What is Nebula-Sync?

[Nebula-Sync](https://github.com/lovelaze/nebula-sync) synchronizes Pi-hole v6.x configuration from a primary instance to one or more replicas. It can run a full Teleporter import/export or selectively sync specific config and gravity database sections, on a schedule via cron.

## Project source links

- [Docker Container](https://hub.docker.com/r/lovelaze/nebula-sync)
- [GitHub Project](https://github.com/lovelaze/nebula-sync)
- [My Docker Compose](docker-compose.yaml)

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [Nebula-Sync GitHub Project](https://github.com/lovelaze/nebula-sync) for a full list.

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `TZ` | unset | Used for logs and to interpret the `CRON` schedule. [List of TZ database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). |

### Core

| Variable | Default Value | Comments |
| -- | -- | -- |
| `PRIMARY` | unset | The primary Pi-hole to sync from, in the format `http://pihole1.example.com\|password`. |
| `REPLICAS` | unset | A comma-separated list of replica Pi-holes to sync to, in the format `http://pihole2.example.com\|password,http://pihole3.example.com\|password`. |
| `FULL_SYNC` | `false` | When `true`, performs a full Teleporter import/export instead of the selective sync options below. |
| `RUN_GRAVITY` | `false` | Runs `pihole updateGravity` on the replicas after a sync. |
| `CRON` | unset | A cron expression for how often to run the sync (e.g. `0 * * * *` for hourly). Leave unset to run once and exit. |
| `CLIENT_SKIP_TLS_VERIFICATION` | `false` | Skips TLS certificate verification when connecting to my Pi-hole instances. Useful for self-signed certs. |
| `CLIENT_RETRY_DELAY_SECONDS` | `1` | Delay, in seconds, between connection retry attempts. |
| `CLIENT_TIMEOUT_SECONDS` | `20` | HTTP client timeout, in seconds. |

### Selective sync (used when `FULL_SYNC=false`)

| Variable | Default Value | Comments |
| -- | -- | -- |
| `SYNC_CONFIG_DNS` | `false` | Syncs the DNS configuration section. |
| `SYNC_CONFIG_DHCP` | `false` | Syncs the DHCP configuration section. |
| `SYNC_CONFIG_NTP` | `false` | Syncs the NTP configuration section. |
| `SYNC_CONFIG_RESOLVER` | `false` | Syncs the resolver configuration section. |
| `SYNC_CONFIG_DATABASE` | `false` | Syncs the database configuration section. |
| `SYNC_CONFIG_MISC` | `false` | Syncs miscellaneous configuration settings. |
| `SYNC_CONFIG_DEBUG` | `false` | Syncs debug configuration settings. |
| `SYNC_CONFIG_DNS_EXCLUDE` | unset | A comma-separated list of DNS config keys to exclude from the sync. |
| `SYNC_GRAVITY_DHCP_LEASES` | `false` | Syncs active DHCP leases. |
| `SYNC_GRAVITY_GROUP` | `false` | Syncs groups. |
| `SYNC_GRAVITY_AD_LIST` | `false` | Syncs adlists. |
| `SYNC_GRAVITY_AD_LIST_BY_GROUP` | `false` | Syncs adlist-to-group associations. |
| `SYNC_GRAVITY_DOMAIN_LIST` | `false` | Syncs domain allow/deny lists. |
| `SYNC_GRAVITY_DOMAIN_LIST_BY_GROUP` | `false` | Syncs domain list-to-group associations. |
| `SYNC_GRAVITY_CLIENT` | `false` | Syncs clients. |
| `SYNC_GRAVITY_CLIENT_BY_GROUP` | `false` | Syncs client-to-group associations. |

## Network

Nebula-Sync doesn't run a web UI of its own — it just connects out to my existing Pi-hole instances — so it doesn't sit behind NPM. It runs on its own dedicated `nebula-sync` network instead of *ProxNET*.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/lovelaze/nebula-sync/issues).
