# ConvertX README
## Environment variables
A review of the environment variables I am using in my environment.  This is not an exhaustive list of all the container environment variables.  For a full list of all environment variables, refer to the [ConvertX Project README](https://github.com/C4illin/ConvertX).

| Variable | Default Value | Comments |
| -- | -- | -- |
| JWT_SECRET | When unset it will use the value from randomUUID() | A long and secret string used to sign the JSON Web Token. |
| HTTP_ALLOWED | false | This determines if you are able to login and convert files through HTTP. Set to `true` to use with HTTP. |
| LOCALPATH | n/a | This is a defined value I use in my Docker environment to define where to store Docker Volumes.  Not part of the project. |
