# MusicReviews
[![CircleCI](https://circleci.com/gh/tetzng/music-reviews/tree/master.svg?style=shield)](https://circleci.com/gh/tetzng/music-reviews/tree/master)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)


音楽を聴いてレビューするサイト

## Description
SpotifyAPIを使用した音楽レビューサイト。
環境構築にDockerを使用し、AWS ECS / Fargateでデプロイ

***DEMO:***


## Features
- Dockerを使用した環境構築
- AWS ECS / Fargateにデプロイ
- データベースにRDSを使用
- ActiveStorageを使用しAWS S3への画像アップロード
- SpotifyAPIを使用
- RSpecを使った単体テスト
- CircleCIによる自動テスト

## Docker images

- ruby:2.6.5-alpine3.10
- mariadb

## Version

- Ruby 2.6.5
- Rails 5.2.3

## Installation

    $ git clone https://github.com/tetzng/music-reviews.git
    $ cd music-reviews
    $ docker-compose build
    $ docker-compose up


## Author

[@tetzng](https://twitter.com/tp_237)


## License

[MIT](http://b4b4r07.mit-license.org)

