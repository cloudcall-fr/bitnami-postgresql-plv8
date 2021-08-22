FROM bitnami/postgresql:11.13.0-debian-10-r0

USER root

RUN apt-get update && \
  apt-get install -y build-essential libtool autoconf unzip wget libproj-dev libgdal-dev git python python3 libc++-dev libxml2-dev libncurses5 libc++abi-dev libc++-dev && \
  # Install plv8
  cd ~ && \
  wget https://github.com/plv8/plv8/archive/refs/tags/v3.0.0.tar.gz && \
  tar -xvzf v3.0.0.tar.gz && \
  cd plv8-3.0.0/ && \
  make -j  $(nproc)  && \
  make install && \
  ldconfig && \
  # Clean up
  apt-get autoclean && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  rm  -rf ~/v3.0.0.tar.gz ~/plv8-3.0.0
