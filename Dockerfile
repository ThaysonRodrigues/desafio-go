FROM golang:alpine as builder
WORKDIR /app
COPY main.go .
RUN go mod init thaysonsouza/desafio-go
RUN go build -o app .

FROM scratch
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["./app"]