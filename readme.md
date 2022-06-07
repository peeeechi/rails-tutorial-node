# Rails Tutorial の nodejs 版実装プロジェクト

[Ruby on Rails チュートリアル](https://railstutorial.jp/chapters/beginning?version=5.1#cha-beginning) を出来るだけ再現しつつ、
その内容をNode.jsで実装していくことで、基本的なWebサービスの実装の流れを理解する

## 変更点

- FrontをNext.jsへ変更する
- FrontendとBackendを分ける
    - Backend にNext.jsを統合する方法もあるようだが、簡易化のために今回はそこまではしない
    - それぞれをDockerコンテナ化し、docker-composeで実装していく
- デプロイ先は以下を想定
    - Frontend → Vercel
    - Backend → Heroku

## Usage

envファイルの生成
```bash
./create_env_file.sh
```

ImageのBuild
```bash
docker-compose build
```

Container起動
```bash
docker-compose up -d
```

Containerへログイン
```bash
docker-compose exec backend /bin/bash
```

Container除去
```bash
docker-compose down
```
