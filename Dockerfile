FROM	offbytwo/ffmpeg:latest as ffmpeg

FROM	djaydev/handbrake:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get upgrade -y && \
    apt-get -y install --no-install-recommends \
    libnuma1 \
    libssl1.1 \
    libfreetype6 \
    bash \
    lsdvd \
    locales \
    python3 \
    && apt-get -y clean && rm -r /var/lib/apt/lists/*

ENV TZ=Asia/Toyko
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /opt/ffmpeg
COPY --from=ffmpeg /opt/ffmpeg .

RUN ln -s /opt/ffmpeg/share/model /usr/local/share/
RUN ldconfig

ENV PATH="/opt/ffmpeg/bin:$PATH"
ENV PKG_CONFIG_PATH="/opt/ffmpeg/lib/pkgconfig"

RUN echo "ja_JP UTF-8" > /etc/locale.gen && locale-gen

ENV LANG=ja_JP.UTF-8

VOLUME	/data
WORKDIR	/data


