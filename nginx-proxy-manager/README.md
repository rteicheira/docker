# Nginx Proxy Manager (NPM) + Tinyauth README

## What is Nginx Proxy Manager + Tinyauth?

> [!TIP]
> For my setup, NPM and Tinyauth are very integrated. To make my life easy, both containers are run from the same Docker Compose file.

[Nginx Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager) is a self-hosted reverse proxy based on Nginx. It allows you to manage reverse proxy hosts and SSL/TLS certificates for self-hosted applications.

[Tinyauth](https://github.com/tinyauthapp/tinyauth/) is a self-hosted OpenID Connect (OIDC) authentication and authorization server.

> [!IMPORTANT]
> This guide is based on v4 of Tinyauth. Tinyauth v5 has been released. Refer to [Updating from v4 to v5 documentation](https://tinyauth.app/docs/breaking-updates/4-to-5/).

## Project source links

- [My Docker Compose](docker-compose.yaml)
- [NPM Website](https://nginxproxymanager.com/)
  - [NPM Docker Container](https://hub.docker.com/r/jc21/nginx-proxy-manager)
  - [NPM GitHub Project](https://github.com/NginxProxyManager/nginx-proxy-manager)
- [Tinyauth Website](https://tinyauth.app/)
  - [Tinyauth Docker Container v4](https://ghcr.io/steveiliop56/tinyauth:v4)
  - [Tinyauth GitHub Project](https://github.com/tinyauthapp/tinyauth/)

## My environment variables overview

### NPM Specific

| Variable | Default Value | Description |
| -- | -- | -- |
| `LOCALPATH` | n/a | I define a volume path in all my Docker Compose files. This is used in the  `volumes` section of the YAML. |
| `DISABLE_IPV6` | `false` | To disable IPV6, set to `true`. |
| `X_FRAME_OPTIONS` | unset | The HTTP [X-Frame-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options) response header can be used to indicate whether a browser should be allowed to render the document in a \<frame>, \<iframe>, \<embed> or \<object>. For my use case I have this set to `sameorigin`. |

### Tinyauth Specific

| Variable | Default Value | Description |
| -- | -- | -- |
| `USER` | unset | The username you will use to login (cleartext) |
| `PASSWORD` | unset | The password for the users above. This will have to be the hash output from generating your username ([see below for how to generate the hash](#tinyauth-setup)). |
| `APP_URL` | unset | The public facing URL that will have the login screen. This should match the URL configured in NPM for the Tinyauth app itself (e.g. `https://auth.example.com`). |
| `APP_TITLE` | unset | Title when you open the app. |
| `LOGIN_MAX_RETRIES` | unset | The number of retries before account is locked. Numeric value. |
| `LOGIN_TIMEOUT` | unset | How long before the login is considered stale. Numeric value in seconds. |
| `SECURE_COOKIE` | unset | Use secure cookies or not. |
| `SESSION_EXPIRY` | unset | How long, in seconds, before the session is expired and a login needs to happen again. Numeric value. |

## Network

This is one of the few services I have that has exposed ports, as all traffic goes through NPM the administration and HTTP(s) ports need to be opened to allow traffic through to the self-hosted application.

| Port | Description |
| -- | -- |
| 80:80 | Public HTTP Port. |
| 443:443 | Public HTTPS Port. |
| 81:81 | Admin Web Port. |
| 3000 | Tinyauth (internal only, not exposed externally). |

## In-app setup

### NPM setup

Once the Docker container is running, access it by going to your server's IP address on port 81. E.g.: `http://10.10.10.10:81`. The default login credentials will be:

- Username: `admin@example.com`
- Password: `changeme`

If you are using Cloudflare for any of your applications, it would be a good idea to set some custom Nginx configurations. The below settings will help identify the correct application in the log files for troubleshooting.

```bash
real_ip_header CF-Connecting-IP;
proxy_hide_header Upgrade;
proxy_hide_header X-Powered-By;
```

You can add this by editing a Proxy Host entry, going to the **Settings** (the "Gear" icon on the right of the proxy host edit popup), and pasting into the **Custom Nginx Configuration** field.

I have configured in app a local TLS cert that my computers are set to trust, as well as certificate with Cloudflare to provide TLS for all external connections.

For a full guide on configuring NPM, visit the [NPM Guide](https://nginxproxymanager.com/guide/) and the [GitHub Discussions](https://github.com/NginxProxyManager/nginx-proxy-manager/discussions) forum.

#### Certificates

For Cloudflare generate a zone wildcard certificate and load the key file provided by Cloudflare into NPM as a custom certificate. It's the same process for any self generated certificate.

The app makes it pretty easy to setup with Let's Encrypt. For beginners I would recommend going that route.

### Tinyauth setup

Before starting Tinyauth, you need to create your username and password, and configure your Time-Based One-Time Password (TOTP) (it isn't required to setup a TOTP, but it ***HIGHLY*** recommended). Log into what is hosting your Docker container and run these commands:

```bash
# Create the user - this will also prompt and output your password
docker run -i -t --rm ghcr.io/steveiliop56/tinyauth:v4 user create --interactive

# For all the below commands, the format will be username:hash:totp

# Add TOTP
docker run -i -t --rm ghcr.io/steveiliop56/tinyauth:v4 totp generate --interactive

# Verify user, password and TOTP
docker run -i -t --rm ghcr.io/steveiliop56/tinyauth:v4 user verify --interactive
```

Once it is running, you need to setup an app within NPM to rely on Tinyauth for login.

> [!NOTE]
> I don't have Single Sign-On (SSO) between Tinyauth and any of my applications. I think this can be done, but I haven't had a need for it.

Within the NPM settings, for the app you want to protect, add the following to the Custom Nginx Configuration (the "Gear" icon on the right of the proxy host edit popup):

```bash
# Only include the below if using Cloudflare for your certificate
real_ip_header CF-Connecting-IP;
proxy_hide_header Upgrade;
proxy_hide_header X-Powered-By;

# Root location
location / {
  # Pass the request to the app
  proxy_pass $forward_scheme://$server:$port;

  # Add other app-specific config here

  # Tinyauth auth request
  auth_request /tinyauth;
  error_page 401 = @tinyauth_login;
}

# Tinyauth auth request
location /tinyauth {
  # Pass request to Tinyauth
  proxy_pass http://tinyauth:3000/api/auth/nginx; # For my setup, NPM and Tinyauth are hosted on the same server in the same Docker Compose file, so I can call it directly.

  # Pass the request headers
  proxy_set_header x-forwarded-proto $scheme;
  proxy_set_header x-forwarded-host $http_host;
  proxy_set_header x-forwarded-uri $request_uri;
}

# Tinyauth login redirect
location @tinyauth_login {
  return 302 http://<auth.example.com>/login?redirect_uri=$scheme://$http_host$request_uri; # Replace with your app URL
}
```

## Disclaimer

> [!WARNING]
> *No warranty or support provided. Use at your own risk.*
> If you have issues, please visit the [NPM's GitHub](https://github.com/NginxProxyManager/nginx-proxy-manager/discussions) or [Tinyauth's GitHub](https://github.com/tinyauthapp/tinyauth/discussions).
