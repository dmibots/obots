FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN yarn install && yarn install qrcode-terminal && yarn install pm2 -g 

COPY . .

EXPOSE 3000

CMD ["node"]
