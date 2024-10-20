ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}
ARG TARGETARCH

ADD src/install.sh install.sh
RUN sh install.sh && rm install.sh

ARG POSTGRES_DATABASE 
ARG POSTGRES_HOST 
ARG POSTGRES_PORT
ARG POSTGRES_USER 
ARG POSTGRES_PASSWORD
ARG PGDUMP_EXTRA_OPTS 
ARG S3_ACCESS_KEY_ID 
ARG S3_SECRET_ACCESS_KEY 
ARG S3_BUCKET
ARG S3_REGION 
ARG S3_PATH 
ARG S3_ENDPOINT 
ARG S3_S3V4 
ARG SCHEDULE 
ARG PASSPHRASE 
ARG BACKUP_KEEP_DAYS

ENV POSTGRES_DATABASE=${POSTGRES_DATABASE}} 
ENV POSTGRES_HOST=${POSTGRES_HOST}
ENV POSTGRES_PORT=${POSTGRES_PORT}
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV PGDUMP_EXTRA_OPTS ''
ENV S3_ACCESS_KEY_ID=${S3_ACCESS_KEY_ID}
ENV S3_SECRET_ACCESS_KEY=${S3_SECRET_ACCESS_KEY}
ENV S3_BUCKET=${S3_BUCKE}
ENV S3_REGION=${S3_REGION}
ENV S3_PATH=${S3_PATH}
ENV S3_ENDPOINT=${S3_ENDPOINT}
ENV S3_S3V4 'no'
ENV SCHEDULE=${SCHEDULE}}
ENV PASSPHRASE=${PASSPHRASE}
ENV BACKUP_KEEP_DAYS=${BACKUP_KEEP_DAYS}

ADD src/run.sh run.sh
ADD src/env.sh env.sh
ADD src/backup.sh backup.sh
ADD src/restore.sh restore.sh

CMD ["sh", "run.sh"]
