FROM node:6.10.3

WORKDIR /app

COPY *.json ./

RUN npm install -g gulp && \
    npm install

EXPOSE ${port}

COPY . .

#CMD npm start

CMD node dev-server.js

RUN if [ "$BUILD_S3" = "true" ]; \
    then echo "building static image..."; \
    gulp dist; \
    fi

#CMD if [ "$RUN_S3" != "true" ]; then echo "running server..."; node dev-server.js; else echo "not running server"; fi

CMD [ "node", "dev-server.js" ]

#CMD gulp dist
