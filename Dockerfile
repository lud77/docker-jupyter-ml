FROM python:3

LABEL maintainer="Stefano Butera <stefno.butera@nethnic.com>"

RUN pip install jupyterlab

RUN apt-get update
RUN apt-get install -y nodejs

ENV NB_USER=gan
ENV NB_UID=1000
ENV NB_GID=100
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV HOME=/home/$NB_USER

RUN groupadd wheel -g 11
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER
RUN chmod g+w /etc/passwd

USER $NB_UID

EXPOSE 8888
WORKDIR $HOME

CMD jupyter lab --no-browser --ip=0.0.0.0 --port=8888 --allow-root
