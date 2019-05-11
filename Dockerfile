FROM balenalib/rpi-alpine:3.9

RUN apk add --no-cache libusb-dev \
    && apk add --no-cache --virtual build-dependencies build-base cmake git \
    && git clone --branch v0.5.4 https://github.com/steve-m/librtlsdr.git \
    && mkdir -p librtlsdr/build \
    && cd librtlsdr/build \
    && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_UDEV_RULES=ON .. \
    && make -j2 install \
    && cp ../rtl-sdr.rules /etc/udev/rules.d/ \
    && ldconfig /etc/ld.so.conf.d \
    && echo 'blacklist dvb_usb_rtl28xxu' | tee -a /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf \ 
    && apk del build-dependencies
