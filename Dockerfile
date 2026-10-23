FROM golang:1.26-alpine

WORKDIR /app

COPY go.mod go.sum ./

RUN go clean -modcache && \
    go mod download -x && \
    go mod verify

COPY . .

RUN go build -o xyz .

CMD ["./xyz"]