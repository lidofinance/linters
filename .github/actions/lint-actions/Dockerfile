FROM rhysd/actionlint@sha256:7cdef15d39bccc1d2ced1f953e917e30b674e67a4faef6df826bec3e53b89e19 as actionlint
FROM node:16
COPY --from=actionlint /usr/local/bin/actionlint /usr/local/bin/actionlint
WORKDIR /
COPY actionlint-matcher.json actionlint-matcher.json
COPY run.sh run.sh