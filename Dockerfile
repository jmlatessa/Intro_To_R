FROM rocker/binder

## Copies your repo files into the Docker Container
USER root
COPY . ${HOME}
RUN chown -R root:users /root/

## Become normal user again
USER ${NB_USER}

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
