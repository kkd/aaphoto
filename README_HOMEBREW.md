# aaphoto - Homebrew対応版

## 概要
Auto Adjust Photoは、画像の自動色補正を行うコマンドラインツールです。macOSのHomebrewに対応しています。

## Homebrewでのインストール

### 1. 依存関係のインストール
```bash
brew install autoconf automake libtool pkg-config
brew install libjpeg-turbo libpng zlib
brew install gcc
```

### 2. ソースからのビルド
```bash
# リポジトリをクローン
git clone git@github.com:kkd/aaphoto.git
cd aaphoto

# 設定ファイルを生成
./autogen.sh

# ビルドとインストール
./configure
make
make install
```

### 3. Homebrew Formulaとしてインストール
```bash
# ローカルFormulaとしてインストール

```

## 使用方法
```bash
# 基本的な使用
aaphoto image.jpg

# 自動調整とリサイズ
aaphoto -a -r600 -q85 *.jpg

# ディレクトリ内の全画像を処理
aaphoto mydir

# 詳細情報付きでリサイズ
aaphoto -V --resize70% image.png
```

## 対応画像形式
- JPEG (.jpg, .jpeg)
- PNG (.png)
- BMP (.bmp)

## 主な機能
- 自動色補正
- リサイズ
- 回転・反転
- 品質調整
- マルチスレッド処理（OpenMP）

## トラブルシューティング

### ライブラリが見つからない場合
```bash
# pkg-configのパスを確認
pkg-config --list-all | grep -E "(jpeg|png|zlib)"

# Homebrewのパスを確認
brew --prefix
```

### OpenMPエラーが発生する場合
```bash
# GCCのバージョンを確認
gcc --version

# OpenMPサポートを確認
gcc -fopenmp -dM -E - < /dev/null | grep -i openmp
```

## ライセンス
GNU General Public License v3.0 またはそれ以降

## 作者
Andras Horvath (mail@log69.com)
