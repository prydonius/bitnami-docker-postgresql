FROM gcr.io/stacksmith-images/minideb:jessie-r6
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_IMAGE_VERSION=9.6.1-r0 \
    BITNAMI_APP_NAME=postgresql \
    BITNAMI_APP_USER=postgres

RUN bitnami-pkg unpack postgresql-9.6.1-1 --checksum 1bd922f6e42bacf1764222e592e0a06b8399d8cc52bb55958834d92049618aeb
ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/sbin:/opt/bitnami/$BITNAMI_APP_NAME/bin:$PATH

COPY rootfs/ /
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["nami", "start", "--foreground", "postgresql"]

VOLUME ["/bitnami/$BITNAMI_APP_NAME"]

EXPOSE 5432
