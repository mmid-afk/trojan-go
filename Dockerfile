FROM debian:stable-slim

RUN apt update && apt install -y wget unzip ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget -O trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/latest/download/trojan-go-linux-amd64.zip \
 && unzip trojan-go.zip \
 && rm trojan-go.zip

COPY config.json /app/config.json

ENV PORT=8080

CMD ["./trojan-go", "-config", "/app/config.json"]
