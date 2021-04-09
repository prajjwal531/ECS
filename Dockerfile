FROM node:10
RUN mkdir -p /opt/node
WORKDIR /opt/node
ENV SECRET_WORD=Prajjaval
COPY quest/ /opt/node/
RUN ls -ltr /opt/node
RUN npm install
EXPOSE 3000