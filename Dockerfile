FROM postgrest/postgrest:v10.2.0 AS postgrest

FROM gcr.io/cloudsql-docker/gce-proxy:1.28.0

COPY --from=postgrest /usr/bin/postgrest /usr/local/bin/postgrest
COPY postgrest.conf /etc/postgrest.conf

ENV PGRST_DB_URI="postgres://postgREST:k4^Sf`~/R7@}*\QG@localhost:5432/anddrop_dev_db"
ENV PGRST_DB_SCHEMA="entities"
ENV PGRST_DB_ANON_ROLE="anonymous"
ENV PGRST_JWT_SECRET="IG1ixftk2apu+DSfmI4yA/W+qk8S46909tH7kOsDy+E="

CMD ["/bin/sh", "-c", "/cloud_sql_proxy -instances=anddrop-tulip:us-east1-c:anddrop-dev-instance=tcp:5432 & exec postgrest /etc/postgrest.conf"]
