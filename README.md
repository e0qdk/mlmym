# mlmym

a familiar desktop experience for [lemmy](https://join-lemmy.org).

![screenshot](https://raw.githubusercontent.com/Fedihosting-Foundation-Forks/mlmym/main/screenshot1.png?raw=true)

This project was originally created by [rystaf](https://github.com/rystaf/mlmym).

As the original project is no longer maintained, this fork is receiving limited life support to support the instance available at [old.lemmy.world](https://old.lemmy.world/).

## deployment

```bash
docker run -it -p "8080:8080" ghcr.io/fedihosting-foundation-forks/mlmym:latest
```

## config

Set the environment variable `LEMMY_DOMAIN` to run in single instance mode

```bash
docker run -it -e LEMMY_DOMAIN='lemmydomain.com' -p "8080:8080" ghcr.io/fedihosting-foundation-forks/mlmym:latest
```

#### default user settings

| environment variable | default |
| -------------------- | ------- |
| LISTING              | All     |
| SORT                 | Hot     |
| COMMENT_SORT         | Hot     |
| DARK                 | false   |
| HIDE_THUMBNAILS      | false   |
| COLLAPSE_MEDIA       | false   |
| LINKS_IN_NEW_WINDOW  | false   |

To override a default setting to true, set the environment variable to any value. To undo an override, leave the variable blank.
