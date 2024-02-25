FROM fedora

RUN dnf install -y curl bash git
RUN curl -fsSL https://pixi.sh/install.sh | bash
WORKDIR /app
COPY convert convert
WORKDIR /app/convert
RUN git clone https://github.com/CharlesMod/quantizeHFmodel
RUN git clone https://github.com/ggerganov/llama.cpp
RUN /root/.pixi/bin/pixi install
ENTRYPOINT ["/root/.pixi/bin/pixi", "run", "python", "./quantizeHFmodel/quantizeHFmodel.py"]
