# MusicReviews
[![CircleCI](https://circleci.com/gh/tetzng/music-reviews/tree/master.svg?style=shield)](https://circleci.com/gh/tetzng/music-reviews/tree/master)
[![codecov](https://codecov.io/gh/tetzng/music-reviews/branch/master/graph/badge.svg)](https://codecov.io/gh/tetzng/music-reviews)
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


## Architecture Diagram
![architecture-diagram](https://user-images.githubusercontent.com/52838441/70861427-0b535e80-1f71-11ea-8df6-2d0ba985e054.png)


## Docker Images

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

