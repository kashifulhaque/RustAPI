# Build stage
FROM rust:1.74-buster as builder

WORKDIR /app

# Accept an argument (Database URL) and set env
ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

COPY . .

RUN cargo build --release

# Production stage
FROM debian:buster-slim

WORKDIR /usr/local/bin

COPY --from=builder /app/target/release/RustAPI .

CMD ["./RustAPI"]