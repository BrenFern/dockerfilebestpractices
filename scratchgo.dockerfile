FROM golang:1.19:alpine AS build

RUN apk add --no-cache git

WORKDIR $GOPATH/src/mypackage/myapp/

COPY . .

RUN got get -d -v

RUN go build -o /go/bin/hello

FROM scratch

COPY --from=build /go/bin/hello /go/bin/hello

ENTRYPOINT [ "/go/bin/hello" ]