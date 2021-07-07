FROM --platform=linux/amd64 node:12.20.0

# locale & timezone (Asia/Tokyo)
# https://github.com/moby/moby/issues/12084
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# system update
RUN apt-get update && \
    apt-get install -y vim less

RUN mkdir -p /var/www/nuxt-restart-ssr
WORKDIR /var/www/nuxt-restart-ssr
COPY ./ /var/www/nuxt-restart-ssr
RUN yarn install
RUN yarn build
ENV HOST 0.0.0.0
EXPOSE 3000

ENTRYPOINT ["yarn", "start"]
