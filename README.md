# serverspec-base

複数のサーバーをserverspecで管理する初期設定をテンプレート化しました。

以下のミドルウェアの設定ファイルがあります。
* Nginx
* PHP-FPM
* PHP
* MySQL

またLinuxの設定を確認するファイル（base）では以下を確認できます。
* ホスト名
* SSH設定

rake spec:allで実行してください。

# サーバーの追加・変更
properties.ymlファイルで変更可能です。
roleで確認したいミドルウェアを設定してください。

# 動作確認環境

* AWS EC2
* Ruby 2.0.0