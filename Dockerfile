FROM debian:bullseye-slim
ENV DEBIAN_FRONTEND noninteractive

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && apt-get -y install \
	bc \
	build-essential \
	bzip2 \
	bzr \
	cpio \
	git \
	libncurses5-dev \
	make \
	rsync \
	scons \
	tree \
	unzip \
	wget \
	zip \
  && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/Kitware/CMake/releases/download/v3.27.9/cmake-3.27.9-linux-x86_64.tar.gz -O /tmp/cmake.tar.gz \
  && tar -xzf /tmp/cmake.tar.gz -C /opt/ \
  && ln -sf /opt/cmake-3.27.9-linux-x86_64/bin/cmake /usr/local/bin/cmake \
  && ln -sf /opt/cmake-3.27.9-linux-x86_64/bin/ctest /usr/local/bin/ctest \
  && ln -sf /opt/cmake-3.27.9-linux-x86_64/bin/cpack /usr/local/bin/cpack \
  && ln -sf /opt/cmake-3.27.9-linux-x86_64/bin/ccmake /usr/local/bin/ccmake \
  && rm /tmp/cmake.tar.gz

RUN mkdir -p /root/workspace
WORKDIR /root

COPY support .
RUN ./setup-toolchain.sh
RUN cat setup-env.sh >> .bashrc
RUN rm -f setup-toolchain.sh

VOLUME /root/workspace
WORKDIR /root/workspace

CMD ["/bin/bash"]