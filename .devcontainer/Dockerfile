# Dev Container用のベースイメージを使用
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ARG USER=vscode
ARG USER_HOME=/home/${USER}

# 基本パッケージのアップデートとインストール
RUN apt-get update && apt-get install -y \
  tmux \
  npm \
  parallel \
  && rm -rf /var/lib/apt/lists/*

USER ${USER}

WORKDIR ${USER_HOME}

# 権限エラー対策のためにキャッシュディレクトリを事前作成
RUN mkdir -p \
  ${USER_HOME}/.vscode-server \
  ${USER_HOME}/.cursor-server \
  ${USER_HOME}/.claude \
  ${USER_HOME}/.cache/mise \
  ${USER_HOME}/.cache/.local/share/mise \
  && touch ${USER_HOME}/.claude.json

# npmインストール設定
ENV PATH="${USER_HOME}/node_modules/.bin:$PATH"
# Claude Codeのインストール
ENV DISABLE_AUTOUPDATER=1
RUN npm install @anthropic-ai/claude-code@1.0.59
# gemini cliのインストール
RUN npm install @google/gemini-cli

# miseのインストール
ENV PATH="${USER_HOME}/.local/bin:$PATH"
ENV MISE_TRUSTED_CONFIG_PATHS=/
COPY mise.toml /tmp/
RUN --mount=type=cache,target=${USER_HOME}/.cache/mise,uid=1000,gid=1000 \
  curl https://mise.jdx.dev/install.sh | sh \
  && echo 'eval "$(mise activate zsh)"' >> ${USER_HOME}/.zshrc \
  && cd /tmp \
  && ${USER_HOME}/.local/bin/mise install

# 作業ディレクトリを設定
WORKDIR /workspace
