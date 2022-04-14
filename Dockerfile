FROM dials/dials:3.9.1

# install the notebook package
RUN source /dials/dials \
    && conda install notebook jupyterlab -y

# create user with a home directory
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser \
    -c "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
RUN passwd -f -u ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
