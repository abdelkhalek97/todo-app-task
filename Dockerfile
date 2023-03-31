FROM cypress/base AS builder
COPY ./Todo-app /
WORKDIR /Todo-app
EXPOSE 8080
RUN yarn upgrade

ENTRYPOINT ["yarn" , "serve"]
