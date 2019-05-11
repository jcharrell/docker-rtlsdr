FROM raspbian/stretch:latest

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get -y install git build-essential cmake libusb-1.0 libopencv-dev libproj-dev
RUN git clone --branch v0.5.4 https://github.com/steve-m/librtlsdr.git \
    && cd librtlsdr \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_UDEV_RULES=ON .. \
    && make -j2 install \
    && cp ../rtl-sdr.rules /etc/udev/rules.d/ \
    && ldconfig \
    && echo 'blacklist dvb_usb_rtl28xxu' | sudo tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

