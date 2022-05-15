FROM golang:1.18 AS builder

WORKDIR /app

COPY . ./
RUN go build full-cycle-rocks.go

FROM scratch
WORKDIR /
COPY --from=builder /app/full-cycle-rocks .

ENTRYPOINT ["./full-cycle-rocks"]