FROM node:14-alpine

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .
RUN npm install --force
RUN npm i -g @angular/cli

COPY . .

EXPOSE 4200

CMD npm install -g http-server

CMD  http-server .\dist\crudtuto-Front\ -p 4200