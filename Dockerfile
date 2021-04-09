FROM node:10
RUN mkdir -p /opt/node
WORKDIR /opt/node
ARG secret
ENV SECRET_WORD=${secret}
COPY quest/ /opt/node/
RUN ls -ltr /opt/node
RUN npm install
EXPOSE 3000