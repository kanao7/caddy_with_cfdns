# 使用官方最新 builder 镜像
FROM caddy:builder AS builder

# 编译只包含 Cloudflare DNS 插件的 Caddy
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# 使用官方最新运行镜像
FROM caddy:latest

# 替换默认的 caddy 二进制文件
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
