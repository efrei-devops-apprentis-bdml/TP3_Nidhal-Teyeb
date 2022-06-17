# syntax=docker/dockerfile:1

FROM openjdk:16-alpine3.13

WORKDIR /home/nidhal/Bureau/Dossier_Nidhal/Scolaire/Efrei/M1/S8/DevOps/tp1/DevOps_TP1

RUN chown 1001 /work \
    && chmod "g+rwX" /work \
    && chown 1001:root /work
COPY --chown=1001:root target/*-runner /work/application

EXPOSE 8080
USER 1001

COPY src ./src

EXPOSE 8081

CMD ["./mvnw", "quarkus:dev"]