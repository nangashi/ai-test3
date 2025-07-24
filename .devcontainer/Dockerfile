# Dev Container用のベースイメージを使用
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# 基本パッケージのアップデートとインストール
RUN apt-get update && apt-get install -y \
  tmux \
  npm \
  && rm -rf /var/lib/apt/lists/*

# Claude Codeのインストール
RUN npm install -g @anthropic-ai/claude-code
# gemini cliのインストール
RUN npm install -g @google/gemini-cli

USER vscode

# Aquaのインストール
COPY aqua.yaml /tmp/
RUN curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.2/aqua-installer | bash \
&& cd /tmp \
&& /home/vscode/.local/share/aquaproj-aqua/bin/aqua i -a \
&& echo 'export PATH="/home/vscode/.local/share/aquaproj-aqua/bin:$PATH"' >> ~/.bashrc

# 権限エラー対策のためにディレクトリを事前作成
RUN mkdir -p \
  /home/vscode/.vscode-server \
  /home/vscode/.cursor-server \
  /home/vscode/.claude

# 作業ディレクトリを設定
WORKDIR /workspace
