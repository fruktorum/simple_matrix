FROM crystallang/crystal:1.2.2-alpine AS build
WORKDIR /app
CMD [ "sh" ]

COPY shard.* ./
RUN shards install

RUN mkdir -p /build

COPY . .
