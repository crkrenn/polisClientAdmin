FROM node:12.13.1

ARG port=5002

WORKDIR /app

COPY . .

RUN npm install -g gulp && \
    npm install

EXPOSE ${port}

CMD npm start
