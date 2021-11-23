## アプリケーション名
「カコモンバック」


## アプリケーション概要
受験生が大学の過去問を解いた後に振り返りとタスク管理を行えるアプリケーションです。
<br>

![2021-11-23](https://user-images.githubusercontent.com/83164817/142977186-0b465fbf-65ac-4c1b-bf73-956f240f2163.png)


## URL
https://mocamoca-lookbackapp.herokuapp.com


## 使用技術
* Ruby 2.6.3p62
* Ruby on Rails 6.1.4.1
* bootstrap 4.3.1
* Postgres SQL
* Puma
* jQuery
* HTML
* SCSS
* omniauth-google-oauth2
* cocoon
* kaminari
* rails-i18n
* AWS
    * Cloud9
* Heroku


## 利用方法
新規登録をして、トップページより「振り返りを書く」ボタンから振り返り作成ページへと遷移し、解いた過去問の年度、大学の詳細、各科目・各大問ごとの振り返り及びそこから割り出したタスク（問題集の同様の単元を5ページ等）を入力します。振り返り一覧ページより過去の振り返りを参照することができ、Todo一覧ページより割り出したタスクの管理（達成したタスクと未達成のタスクとで分別）ができます。
<br>

![2021-11-23](https://user-images.githubusercontent.com/83164817/142977835-e40a3b09-034f-4314-8943-547fd3832d96.png)


![2021-11-23](https://user-images.githubusercontent.com/83164817/142977824-2b943ad5-1a43-4228-972a-8f8f86852026.png)


## 目指した課題解決
大学受験に向けて過去問を解く受験生が、結果を細かく分析して自身の実力を知り、合格へのプロセスを明確にイメージできるようになることで、効率良く学力を向上させることを目指しました。


## 機能一覧
* ユーザー登録、ログイン機能
    * googleアカウントによるログイン（omniauth-google-oauth2）
    * お試しログイン機能
* 振り返り作成機能
    * 動的なフォーム機能（cocoon）
    * バリデーション機能 (rails-i18n)
    * 削除時のフェードアウトアニメーション機能（jQuery）
* ページネーション機能（kaminari）
* 各ページの認可機能
* Todoの管理機能
    * 達成状態への遷移機能（Ajax）
    * 削除機能（Ajax）
* メニューバーのアニメーション機能（jQuery）
* 各ページのレスポンシブ機能
* 各ボタンのアニメーション機能（SCSS, jQuery）

## テスト
* 単体テスト（models）
* 機能テスト (controllers)
* 統合テスト（integrations）


## 実装予定の機能
* 過去問だけでなく、模試の振り返りを登録できる振り返り作成機能
* 過去に登録した大学の学部学科等をボタン一つで自動入力する機能
* 振り返りの大学ごとに表示機能
* 振り返りをGoogle Docs APIを用いてドキュメントに出力する機能
* アカウントの写真や名前の編集機能
* 振り返りページの各大問の振り返りやふせんのドラックアンドドロップ
* googleアカウント以外でのログイン機能

