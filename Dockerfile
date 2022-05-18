FROM golang:alpine as builder

WORKDIR /src/app

COPY . .

RUN go build -o /src/bin/app main.go

FROM scratch

COPY --from=builder /src/bin/app /app

ENTRYPOINT ["/app"]
