# テスト作成アプリ EXAM(イグザム)

![イメージ図](https://user-images.githubusercontent.com/61282574/90377143-82b63080-e0b2-11ea-85a6-92a1cb11d9be.png)

### URL
https://kk-exam.herokuapp.com/

## 概要
* 作成したテストをユーザが解答できるアプリケーションです。
* テストの得点や平均点がグラフで可視化され、学習意欲が高まります。
* 先生からのフィードバックがもらえるコメント機能もあります。

## バージョン情報
* Ruby 2.6.5
* Rails 5.2.4
* PostgreSQL 12.3

## カタログ設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vS0qJX9DVM8CgiTRwX-6f2CdStV7WGHJHK6OOsTtqzFHD-gv8uaCRjbdsSGyyPZ7bs9W7hyfeH2qw5E/pubhtml?gid=1177389026&single=true

## 機能一覧
#### ・認証機能
 1. ログイン機能
 2. ユーザ登録機能(name, email, password)
 3. パスワード再設定機能
 4. 管理者権限機能

#### ・テスト作成機能
 1. 作成・一覧・編集・削除ができる
 2. 解答期限を設定できる(期限が切れたら解答できなくなる)
 3. テストを管理できるのはAdmin(先生)のみ

#### ・テスト解答機能
 1. テストの解答を送信(create)できる
 2. 送信時に確認させる
 3. 送信したら結果ページに遷移し、点数がわかる
 4. テストなので編集・削除はできない

#### ・コメント機能
 1. テストの出来やフィードバックなどのコメントができる

#### ・フィードバック機能
 1. 平均点を表示できる

## テーブル定義書
https://docs.google.com/spreadsheets/d/e/2PACX-1vSVwkfGAYxjft_OjCMKSc0TQcrbDwVyOLfb4nBg3R-Mr-fV5knI-Dl5Q1-JFSbeKWeyhku40GBNwayU/pubhtml

## ER図
https://app.diagrams.net/?lightbox=1&highlight=0000ff&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E8%AA%B2%E9%A1%8C_ER%E5%9B%B3.drawio#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D144GewCG7nEqulHHuACILsYFG7N5Y0B_w%26export%3Ddownload

## 画面遷移図(Draw.io)
https://app.diagrams.net/?lightbox=1&highlight=0000ff&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E8%AA%B2%E9%A1%8C_%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1xrczWWQXI8FoplM0ihohuPjfQ__4NqjS%26export%3Ddownload

## ワイヤーフレーム(Draw.io)
https://app.diagrams.net/?lightbox=1&highlight=0000ff&layers=1&nav=1&page-id=6CdDfpiUVr9pXKbfYv6x&title=%E5%8D%92%E6%A5%AD%E8%AA%B2%E9%A1%8C_%E7%94%BB%E9%9D%A2%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%BC%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1pTi2UplWFCS6qCt-9AFbNFnctWqH3jjZ%26export%3Ddownload

## 主な使用Gem
* devise
* cancancan
* rails_admin
* carrierwave
* mini_magick
* bootstrap4
* chartkick
* ransack
