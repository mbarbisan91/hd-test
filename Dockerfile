FROM golang:1.20 AS build
WORKDIR /app
COPY . .
RUN go build -o server server.go
FROM golang:1.20
WORKDIR /app
COPY --from=build /app/server .
EXPOSE 8080
CMD ["./server"]
