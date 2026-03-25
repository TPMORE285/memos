# ---- Build frontend ----
FROM node:20-alpine AS frontend
WORKDIR /app/web

COPY web/ .
RUN npm install -g pnpm && pnpm install && pnpm build

# ---- Build backend ----
FROM golang:1.22-alpine AS backend
WORKDIR /app

COPY . .
RUN go build -o memos ./cmd/memos

# ---- Final image ----
FROM alpine:latest
WORKDIR /app

# Copy backend
COPY --from=backend /app/memos /app/memos

# Copy frontend build
COPY --from=frontend /app/web/dist /app/web/dist

EXPOSE 5230

CMD ["/app/memos"]