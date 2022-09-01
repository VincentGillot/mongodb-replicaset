FROM debian:11

ENV KEY_FILE_SECRET=mysecretkey
ENV MONGO_ROOT_USER=root
ENV MONGO_ROOT_PASSWORD=root
ENV MONGO_CLIENT_USER=client
ENV MONGO_CLIENT_PASSWORD=client
ENV MONGO_CLIENT_DATABASE=main

COPY ./config/entry-point.sh /
COPY ./config/init-mongodbs.sh /
COPY ./config/create-root.js /
COPY ./config/init.js /
COPY ./config/create-user.js /

EXPOSE 27017
EXPOSE 27018
EXPOSE 27019

ENTRYPOINT [ "bash", "entry-point.sh" ]
