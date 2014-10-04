# QiitaScouter

[![Gem Version](https://badge.fury.io/rb/qiita_scouter.svg)](http://badge.fury.io/rb/qiita_scouter)
[![Build Status](https://travis-ci.org/tbpgr/qiita_scouter.png?branch=master)](https://travis-ci.org/tbpgr/qiita_scouter)
[![Coverage Status](https://coveralls.io/repos/tbpgr/qiita_scouter/badge.png)](https://coveralls.io/r/tbpgr/qiita_scouter)

Qiita Scouter  

## 概要

Qiitaの記事投稿、フォロワー、タグ、ストック数を戦闘力化します

## 動作確認済み環境
* ruby 2.0.0 環境にて動作確認済み

## サブコマンド

|コマンド|ショートカット|内容|
|:--|:--|:--|
|analyze|a|スカウターの計測実行|
|help|h|ヘルプの表示|
|version|v|バージョンの表示|

## インストール

Add this line to your application's Gemfile:

    gem 'qiita_scouter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qiita_scouter

## ヘルプ

~~~bash
$ qiita_scouter h
Commands:
  qiita_scouter analyze         # Analyze qiita power_levels
  qiita_scouter help [COMMAND]  # Describe available commands or one specific...
  qiita_scouter version         # version

Options:
  -h, [--help]     # help message.
      [--version]  # version
~~~

## 使用例

* 計測実行（ユーザー名 tbpgr の場合）

※対象ユーザーの投稿記事数が多いと、その分時間がかかります

または

~~~bash
$ qiitam a tbpgr
ユーザー名: tbpgr 戦闘力: 101717 攻撃力: 10780 知力: 87010 すばやさ: 3927
~~~

または

~~~bash
$ qiitam analyze tbpgr
ユーザー名: tbpgr 戦闘力: 101717 攻撃力: 10780 知力: 87010 すばやさ: 3927
~~~

## History
* version 0.0.1 : 2014/09/16 : first release

## 注意事項
* Qiita APIに負担をかけすぎないように、短時間・大量実行は控えましょう

## Contributing

1. Fork it ( https://github.com/tbpgr/qiita_scouter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
