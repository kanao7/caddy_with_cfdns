# 使用官方最新 builder 镜像
FROM caddy:builder AS builder

# 编译包含 Cloudflare DNS 插件的 Caddy
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

# 使用官方最新运行镜像
FROM caddy:latest

# --- 新增部分：安装时区数据库 ---
RUN apk add --no-cache tzdata

# 替换默认的 caddy 二进制文件
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
