FROM dials/dials:3.9.1

ARG NB_USER=dials
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
RUN passwd -f -u ${NB_USER}}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
