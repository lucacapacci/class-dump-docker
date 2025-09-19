FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

WORKDIR /

COPY setup_script.sh /setup_script.sh

RUN chmod +x /setup_script.sh

RUN ./setup_script.sh

WORKDIR /

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/class-dump-linux/source/obj

CMD ["bash", "-c", "/classdump /b"]

