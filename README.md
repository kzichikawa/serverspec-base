# serverspec-base

複数のサーバーをserverspecで管理する初期設定をテンプレート化しています。

以下のミドルウェアのテンプレートを準備しました。
* Nginx
* PHP-FPM
* PHP
* MySQL

またLinuxの以下の設定を確認するテンプレート
* ホスト名
* SSH設定

# サーバーの追加・変更
properties.ymlファイルで変更可能です。
roleで確認したいミドルウェアを設定してください。

# 動作確認環境

* AWS EC2
* Ruby ruby 2.0.0
