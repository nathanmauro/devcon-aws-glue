ARG GLUE_VERSION="4.0.0"
FROM amazon/aws-glue-libs:glue_libs_${GLUE_VERSION}_image_01

ARG AWS_PROFILE=localstack
ARG USE_SSO=true
ARG USER=glue_user

USER root
RUN chmod -R 777 /usr/local/lib/python3.10

USER $USER

ARG HOME="/home/$USER"
ARG POETRY_VERSION="none"

COPY credentials /home/glue_user/.aws/credentials
COPY localstack-hive-site.xml /home/glue_user/spark/conf/hive-site.xml
COPY .bashrc /home/glue_user/.bashrc.1
COPY localstack.bash_aliases /home/glue_user/.bash_aliases
COPY post-attach.sh /home/glue_user/post-attach.sh
COPY post-create.sh /home/glue_user/post-create.sh

ENV AWS_PROFILE=${AWS_PROFILE}
ENV USE_SSO=${USE_SSO}
ENV PATH="${HOME}/.local/bin:$PATH"

RUN if [ "${POETRY_VERSION}" != "none" ]; then  echo "Installing poetry" \
    && curl -sSL https://install.python-poetry.org | POETRY_VERSION=${POETRY_VERSION} python3 - ; \
    fi

#RUN #set -ex
#RUN #printf "\nsource ~/.bashrc.1\n" >>~/.bashrc
#RUN #poetry install
#RUN #git config --list | grep "safe.directory=$(pwd)" || git config --global --add safe.directory $(pwd)
#RUN #~/spark/sbin/start-history-server.sh || echo "Spark history server already running!"
