# 严格匹配项目要求：Python3.10（<3.11）
FROM python:3.10-slim

# 设置工作目录（CodeSpaces默认目录）
WORKDIR /workspaces

# 安装系统依赖（解决pymilvus/oss2等包的编译问题）
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    make \
    git \
    libpq-dev \
    libssl-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 复制依赖文件
COPY requirements.txt .

# 安装Python依赖（用清华源，和项目配置一致）
RUN pip install --no-cache-dir -r requirements.txt \
    -i https://pypi.tuna.tsinghua.edu.cn/simple \
    --upgrade pip

# 保持容器运行（CodeSpaces必需）
CMD ["tail", "-f", "/dev/null"]