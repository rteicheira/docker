# Karakeep README

## What is Karakeep?

[Karakeep](https://github.com/karakeep-app/karakeep) (formerly Hoarder) is a self-hosted bookmark and content manager. It lets me save links, notes, images, and PDFs, then automatically tags and organizes them using AI and indexes everything with full-text search.

## What is...?

- [Karakeep & Chrome](https://github.com/karakeep-app/karakeep) is the main web app and API. Chrome runs headless and used to render pages, take screenshots when saving links.
- [Meilisearch](https://github.com/meilisearch/meilisearch) provides the full-text search index used by Karakeep.

## Project source links

- [My Docker Compose](docker-compose.yaml)

| Project | Website | Container | GitHub Project |
| -- | -- | -- | -- |
| Karakeep | [Website](https://docs.karakeep.app/) | [Container](https://ghcr.io/karakeep-app/karakeep) | [GitHub Project](https://github.com/karakeep-app/karakeep) |
| Chrome | [Website](https://docs.karakeep.app/) | [Container](https://ghcr.io/karakeep-app/karakeep-chrome) | [GitHub Project](https://github.com/karakeep-app/karakeep) |
| Meilisearch | [Website](https://www.meilisearch.com/) | [Container](https://hub.docker.com/r/getmeili/meilisearch) | [GitHub Project](https://github.com/meilisearch/meilisearch) |

## My environment variables overview

A review of the environment variables I am using in my environment. This is not an exhaustive list of all the container environment variables. Visit the [Karakeep documentation](https://docs.karakeep.app/configuration) for a full list.

### Global

| Variable | Default Value | Comments |
| -- | -- | -- |
| `LOCALPATH` | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes. Not part of the project. |

### Karakeep Specific

| Variable | Default Value | Comments |
| -- | -- | -- |
| `KARAKEEP_VERSION` | `release` | The image tag to pull. |
| `NEXTAUTH_SECRET` | unset | A random string used to sign authentication tokens. Generate with `openssl rand -base64 36`. |
| `NEXTAUTH_URL` | unset | The public facing URL of my Karakeep instance, used for auth redirects. |
| `MEILI_MASTER_KEY` | unset | The master key for the Meilisearch instance. Generate with `openssl rand -base64 36 \| tr -dc 'A-Za-z0-9'`. |
| `DISABLE_SIGNUPS` | `false` | Set to `true` to hide the signup button and prevent new account registration once I've created my own. |
| `OPENAI_API_KEY` | unset | Enables AI-based automatic tagging via OpenAI. Leave unset if relying on a local Ollama instance instead (not part of my setup). |

## Network

ProxNET is my main Docker network with access to each container managed through [Nginx Proxy Manager (NPM)](https://github.com/rteicheira/docker/blob/main/nginx-proxy-manager/). This is why I have no ports defined in any of my compose files. Refer to the originals for each container's default port.

The `web` container also shares a dedicated internal `karakeep` network with `chrome` and `meilisearch` so they can talk to each other without being exposed on *ProxNET*.

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [developer's GitHub](https://github.com/karakeep-app/karakeep/issues).
