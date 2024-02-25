FROM ubuntu

RUN apt-get update && apt-get install -y curl bash git build-essential
RUN curl -fsSL https://pixi.sh/install.sh | bash
WORKDIR /app
COPY convert convert
WORKDIR /app/convert
RUN git clone https://github.com/CharlesMod/quantizeHFmodel
RUN git clone https://github.com/ggerganov/llama.cpp
RUN /root/.pixi/bin/pixi install
COPY run.sh run.sh
ENTRYPOINT ["/bin/bash", "run.sh"]
