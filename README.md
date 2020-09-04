# テスト作成アプリ EXAM(イグザム)

![イメージ図](https://user-images.githubusercontent.com/61282574/90377143-82b63080-e0b2-11ea-85a6-92a1cb11d9be.png)

### URL
https://kk-exam.work/

## 概要
* 作成したテストをユーザが解答できるアプリケーションです。
* テストの得点や平均点がグラフで可視化され、学習意欲が高まります。
* 先生からのフィードバックがもらえるコメント機能もあります。
* 問題ごとの正答率を算出し、データ分析も行えます。
* 過去の問題を再利用して、復習試験を作成することもできます。

## 使用技術一覧
* Ruby on Rails
* Bootstrap4
* JQuery
* PostgreSQL
* AWS (EC2 / S3 / Route53 / ELB / ACM)
* Nginx
* Github (Github Flow)
* Editor (Atom)
* RSpec

## ERD
![卒業課題_ER図](https://user-images.githubusercontent.com/61282574/91688161-5c0cf500-eb9c-11ea-8682-71e876549132.png)

## 設計
[カタログ設計](https://docs.google.com/spreadsheets/d/e/2PACX-1vS0qJX9DVM8CgiTRwX-6f2CdStV7WGHJHK6OOsTtqzFHD-gv8uaCRjbdsSGyyPZ7bs9W7hyfeH2qw5E/pubhtml?gid=1177389026&single=true)

[テーブル設計](https://docs.google.com/spreadsheets/d/e/2PACX-1vSVwkfGAYxjft_OjCMKSc0TQcrbDwVyOLfb4nBg3R-Mr-fV5knI-Dl5Q1-JFSbeKWeyhku40GBNwayU/pubhtml)

[画面遷移図](https://app.diagrams.net/?lightbox=1&highlight=0000ff&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E8%AA%B2%E9%A1%8C_%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1xrczWWQXI8FoplM0ihohuPjfQ__4NqjS%26export%3Ddownload)

[ワイヤーフレーム](https://app.diagrams.net/?lightbox=1&highlight=0000ff&layers=1&nav=1&page-id=6CdDfpiUVr9pXKbfYv6x&title=%E5%8D%92%E6%A5%AD%E8%AA%B2%E9%A1%8C_%E7%94%BB%E9%9D%A2%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%BC%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D1pTi2UplWFCS6qCt-9AFbNFnctWqH3jjZ%26export%3Ddownload)

## 機能一覧
#### ・認証機能
 1. ログイン機能
 2. ユーザ登録機能(学籍番号を認証に使います)
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

#### ・フィードバック機能
 1. 平均点や得点の傾向をグラフで可視化できる
 2. テストについてのコメントができる
 3. 復習問題試験が作成できる

## 開発におけるポイント
#### ・Github Flowに基づいた開発フロー
- 個人開発ではありますが、チーム開発を意識した開発を行いました。イシューを立て、ブランチを切り開発、プルリクエストをあげ、マージさせる流れを常に意識しました。

#### ・データ分析ツールとしての活用を意識
- 主要機能としてはテストを作成し、解答するアプリです。しかし、得点や平均点をグラフ化したり、それぞれの問題の正答率を算出するなど、データとして可視化し、活用できるという点を意識して実装しました。

#### ・UI/UXへのこだわり
- フロント部分はフレームワークであるBootstrap4を使用しています。生徒が使用するツールであることをふまえて、タブレットやスマホ表示ができるようレスポンシブデザインにこだわりました。また、スマホ表示時にはフッターメニューが出るようにしており、操作性を考えた実装を心がけました。

## 今後の課題
#### Dockerの導入
- 個人開発ではありますが、チームでの開発を意識し、現在のアプリケーションにDockerを導入するため、現在勉強中です。

#### CI/CDパイプライン構築
- テストに関してはRSpecを利用し、モデルテスト、E2Eテストを行ってきました。今後、CircleCIを導入し、開発効率アップを目指していきたいと思っています。

## バージョン情報
* Ruby 2.6.5
* Rails 5.2.4
* PostgreSQL 12.3

## 使用した主なGem
* 認証関係　　　　：devise / cancancan / rails_admin
* 画像アップロード：carrierwave / mini_magick
* グラフ表示　　　：chartkick
* 検索機能　　　　：ransack
* ページネーション：kaminari
* フロント部分　　：bootstrap / jquery-rails / font-awesome-sass
* AWSデプロイ　　：unicorn / mini_racer / capistrano など
* その他　　　　　：rspec-railなどテスト系、pry-railsなどデバッグ系
