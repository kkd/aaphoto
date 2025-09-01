#!/bin/bash
# install_homebrew.sh - Homebrew環境でのaaphotoインストールスクリプト

set -e

echo "=== aaphoto Homebrew対応版インストールスクリプト ==="

# macOSかどうかチェック
if [ "$(uname)" != "Darwin" ]; then
    echo "エラー: このスクリプトはmacOS専用です"
    exit 1
fi

# Homebrewがインストールされているかチェック
if ! command -v brew >/dev/null 2>&1; then
    echo "エラー: Homebrewがインストールされていません"
    echo "Homebrewをインストールしてください: https://brew.sh/"
    exit 1
fi

echo "Homebrewを検出しました: $(brew --prefix)"

# 依存関係をインストール
echo "依存関係をインストール中..."
brew bundle --file=Brewfile

# autogen.shを実行
echo "設定ファイルを生成中..."
./autogen.sh

# configureを実行
echo "configureを実行中..."
./configure

# ビルド
echo "ビルド中..."
make

# インストール（オプション）
read -p "システムにインストールしますか？ (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "インストール中..."
    sudo make install
    echo "インストール完了！"
else
    echo "ビルド完了！実行可能ファイルは現在のディレクトリにあります"
fi

echo "=== インストール完了 ==="
echo "使用方法: ./aaphoto --help"
