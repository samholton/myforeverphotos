FROM ruby:3.2.2-buster AS build
COPY . /app
WORKDIR /app
RUN bundle install \
    && jekyll build

FROM nginx:1.27.3-alpine3.20 AS final
COPY --from=build /app/_site /usr/share/nginx/html
