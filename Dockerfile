FROM node:6.10.3

WORKDIR /app

COPY *.json ./

RUN npm install -g gulp && \
    npm install

EXPOSE ${port}

COPY . .

#CMD npm start
ARG BUILD_S3
ARG USE_S3

CMD if [ "$BUILD_S3" != "true" ]; then \
        echo "BUILD_S3: >>${BUILD_S3}<<"; \
        echo "not building static image"; \
    else \
        echo "BUILD_S3: >>${BUILD_S3}<<"; \
        echo "building static image..."; \
        gulp dist; \
    fi; \
    if [ "$USE_S3" != "true" ]; then \
        echo "USE_S3: >>${USE_S3}<<"; \
        echo "running server..."; \
        node dev-server.js; \
    else \
        echo "USE_S3: >>${USE_S3}<<"; \
        echo "not running server"; \
    fi

#CMD [ "node", "dev-server.js" ]

#CMD gulp dist
