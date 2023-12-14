FROM --platform=linux/x86_64 debian:bookworm AS build

RUN set -xe; \
    apt -yqq update; \
    apt -yqq install \
        git \
        nodejs \
        npm \
    ;

RUN mkdir /src
WORKDIR /src

RUN set -xe; \
    git clone https://github.com/prisma/prisma-examples --depth=1; \
    cd prisma-examples/javascript/rest-express; \
    npm install; \
    npx prisma migrate dev --name init \
    ;

FROM scratch

# rest-express + Prisma
COPY --from=build /src/prisma-examples/javascript/rest-express /rest-express
