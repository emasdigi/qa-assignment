FROM node:12-alpine

RUN apk add --no-cache --virtual .gyp \
        make \
        curl \
        g++ \
        bash \
        python \
        git
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY . ./
COPY package.json ./
COPY package-lock.json ./
RUN npm install
CMD ["npm", "start"]
EXPOSE 3000
