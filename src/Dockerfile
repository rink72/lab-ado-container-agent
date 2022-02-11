FROM ubuntu:20.04

USER root

COPY install.sh /tmp/install.sh
RUN sh -c /tmp/install.sh

# Run some rough tests
COPY tests.sh /tmp/tests.sh
RUN sh -c /tmp/tests.sh