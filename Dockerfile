FROM google/dart:2.2
 AS builder
ENV PATH="${PATH}:/root/.pub-cache/bin"
RUN pub global activate webdev 2.2.0
COPY . /root/build-here/
WORKDIR /root/build-here
RUN pub get && \
    webdev build --output web:build

FROM nginx
EXPOSE 80
RUN sed -i -e 's,   location / {,   location /ss2019/team-4e {,g' /etc/nginx/conf.d/default.conf; \
sed -i -e 's,        root   /usr/share/nginx/html;,        alias   /usr/share/nginx/html;,g' /etc/nginx/conf.d/default.conf
COPY --from=builder /root/build-here/build /usr/share/nginx/html

