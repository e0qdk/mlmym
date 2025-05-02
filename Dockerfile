# syntax=docker/dockerfile:1

FROM golang:1.23-bookworm AS builder

RUN git config --global --add safe.directory /app

WORKDIR /app

COPY . ./
RUN git describe --tags > VERSION
RUN \
    --mount=type=cache,target=/go/pkg/mod \
    go build -v -o mlmym


FROM debian:bookworm-slim

WORKDIR /app

RUN \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt update && apt-get --no-install-recommends install -y ca-certificates curl

COPY templates /app/templates
COPY public /app/public
COPY --from=builder /app/VERSION /app/VERSION
COPY --from=builder /app/mlmym /app/mlmym

CMD ["./mlmym", "--addr", "0.0.0.0:8080"]
