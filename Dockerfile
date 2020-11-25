FROM golang:1.15-alpine AS build
WORKDIR /go/src/github.com/george_angel/drone-test-project
COPY . /go/src/github.com/george_angel/drone-test-project
RUN apk --no-cache add git &&\
 go get ./... &&\
 CGO_ENABLED=0 go build -o /drone-test-project .

FROM alpine:3.12
COPY --from=build /drone-test-project /drone-test-project
CMD [ "/drone-test-project" ]

