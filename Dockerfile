FROM kalilinux/kali

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    autoconf \
    libtool \
    pkg-config \
    build-essential \
    python-docutils \
    libcppunit-dev \
    swig \
    doxygen \
    liblog4cpp5-dev \
    python-gtk2 \
    python-scipy \
    gnuradio-dev \
    gr-osmosdr \
    libosmocore-dev


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git &&\
    git clone https://git.osmocom.org/gr-gsm &&\
    cd gr-gsm &&\
    mkdir build &&\
    cd build &&\
    cmake .. &&\
    mkdir $HOME/.grc_gnuradio/ $HOME/.gnuradio/ &&\
    make -j 4 &&\
    make install &&\
    ldconfig

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y wireshark 