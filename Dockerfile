FROM mransan/dev:latest

RUN bash

RUN opam update && \
    opam install -y ocaml-protoc

WORKDIR /root

COPY    raft.git raft.git 
WORKDIR /root/raft.git 
RUN     opam pin -y add raft . 

WORKDIR /root

COPY    raft-udp.git raft-udp.git 
WORKDIR /root/raft-udp.git 

RUN     ["/bin/bash", "-c", "eval `opam config env`&& make"]
