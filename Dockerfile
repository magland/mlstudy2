# Set the base image to Ubuntu
FROM ubuntu:xenial

RUN apt-get update
RUN apt-get update && apt-get install -y software-properties-common

# Install git and NodeJS
RUN apt-get update && apt-get install -y git vim curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && apt-get install -y nodejs

ARG BUILD_DATE=$BUILD_DATE   
WORKDIR /home
RUN git clone https://github.com/magland/mlstudy2.git
WORKDIR /home/mlstudy2
RUN npm install
RUN node --use-strict node_modules/webpack-cli/bin/webpack.js --devtool source-map --mode development

CMD ["/usr/bin/npm", "start"]
