# README
# テスト作成アプリ

## 概要
* 作成したテストをユーザが解答できるアプリケーションです。
* 平均点を表示させたり、正答率の悪い問題を再出題できたりするなど、学習効率を高める機能も備えています。
* コメント機能では、先生からのフィードバックがもらえるなど、生徒への働きかけもできます。

## バージョン情報
* Ruby 2.6.5
* Rails 5.2.4
* PostgreSQL 12.2

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
 2. 正答率の悪い問題を復習問題として再出題できる

## テーブル定義書
https://docs.google.com/spreadsheets/d/e/2PACX-1vSVwkfGAYxjft_OjCMKSc0TQcrbDwVyOLfb4nBg3R-Mr-fV5knI-Dl5Q1-JFSbeKWeyhku40GBNwayU/pubhtml

## ER図
* テーブル定義書内に記載

## 画面遷移図(Draw.io)
https://app.diagrams.net/?lightbox=1&highlight=0000ff&layers=1&nav=1#G1xrczWWQXI8FoplM0ihohuPjfQ__4NqjS

## ワイヤーフレーム(Draw.io)
https://app.diagrams.net/?lightbox=1&highlight=0000ff&layers=1&nav=1#G1pTi2UplWFCS6qCt-9AFbNFnctWqH3jjZ

## 使用予定Gem
* devise
* cancancan
* rails_admin
* carrierwave
* mini_magick
* whenever
