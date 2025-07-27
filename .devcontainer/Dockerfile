# Dev Container用のベースイメージを使用
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ARG USER=vscode
ARG USER_HOME=/home/${USER}

# 基本パッケージのアップデートとインストール
RUN apt-get update && apt-get install -y \
  tmux \
  npm \
  && rm -rf /var/lib/apt/lists/*

USER ${USER}

WORKDIR ${USER_HOME}

# npmインストール設定
ENV PATH="${USER_HOME}/node_modules/.bin:$PATH"
# Claude Codeのインストール
RUN npm install @anthropic-ai/claude-code
# gemini cliのインストール
RUN npm install @google/gemini-cli

# Aquaのインストール
ENV PATH="${USER_HOME}/.local/share/aquaproj-aqua/bin:$PATH"
COPY aqua.yaml /tmp/
RUN curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.2/aqua-installer | bash \
  && cd /tmp \
  && aqua i -a

# aquaで導入するツール関連の設定
RUN cd /tmp \
  && just --completions zsh >> ${USER_HOME}/.zshrc

# 権限エラー対策のためにキャッシュディレクトリを事前作成
RUN mkdir -p \
  ${USER_HOME}/.vscode-server \
  ${USER_HOME}/.cursor-server \
  ${USER_HOME}/.claude

# 作業ディレクトリを設定
WORKDIR /workspace
