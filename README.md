# 最小二乗法の計算
![test](https://github.com/hamanoakito/robosys2024/actions/workflows/test.yml/badge.svg)


## 概要
- 最小二乗法の直線の式を求めることが出来る
- 計算するのに必要な値を見ることが出来る


## 実行方法
以下の手順で実行してください


1.次のコマンドでリポジトリをgithubから取り込む
 ```
 git clone https://github.com/hamanoakito/robosys2024
 ```

2.robosys2024に移動
 ```
 cd robosys2024
 ```

3.最小二乗法を計算できるOLSファイルに実行権限の付与
 ```
 chmod +x OLS
 ```

## 使用方法
以下のように入力してください
 ```
 echo -e "xのデータ"\\n"yのデータ" | ./OLS
 ```


実行方法例
 ```
 echo -e "1 2 3\\n4 5 6" | ./OLS
 ```


## 注意点
**※データを入力する際にデータごとに空白を空けてください**
**※xのデータ数とyのデータ数に違いがないか確認してください**
## 必要なソフトウェア
- Python 
  - テスト済みバージョン: 3.7~3.10

## テスト環境
- Ubuntu 24.04 LTS

© 2024 Akito Hamano
