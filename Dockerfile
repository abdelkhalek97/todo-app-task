FROM cypress/base AS builder
COPY ./Todo-app /
WORKDIR /Todo-app

RUN yarn upgrade

ENTRYPOINT ["yarn" , "serve"]
