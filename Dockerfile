# ---- Build Stage ----
FROM golang:1.25-alpine AS builder

RUN apk add --no-cache git nodejs npm

WORKDIR /app

# Backend deps
COPY go.mod go.sum ./
RUN go mod download

# Frontend
COPY web ./web
WORKDIR /app/web
RUN npm install
RUN npm run build

# Backend source
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o memos ./cmd/memos

# ---- Runtime Stage ----
FROM alpine:3.19

WORKDIR /app

COPY --from=builder /app/memos /app/memos
COPY --from=builder /app/web/build ./web/build  # frontend build

EXPOSE 8081
ENV PORT=8081

CMD ["./memos"]
