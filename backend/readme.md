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


## 環境構築

### Dockerfile(Frontend)の作成

```bash
mkdir -p frontend/src
mkdir -p backend/src
```

## Backend の作成

NestJS を使用する

[TypeORMとPostgresを使用したNestJS](https://betterprogramming.pub/nest-js-project-with-typeorm-and-postgres-ce6b5afac3be)
[NestJSの基礎概念の図解と要約](https://zenn.dev/morinokami/articles/nestjs-overview)

### NestJS アプリケーションの作成

nest-cli を使用してアプリケーションをスキャフォールディングする


```bash
nest new nest-postgres -p npm
cd nest-postgres
```

[`nest new` command](https://docs.nestjs.com/cli/usages#nest-new)

### 初めてのgit commit

```bash
git add .
git commit -m "init app"
```

### 依存パッケージのインストール

```bash
npm install @nestjs/config @nestjs/typeorm typeorm pg class-validator class-transformer
npm install -D @types/node
```

|package-name|description|
|:--|:--|
| `@nestjs/config` |  |
| `@nestjs/typeorm` |  |
| `typeorm` |  |
| `pg` |  |
| `class-validator` |  |
| `class-transformer` |  |
| `@types/node` |  |

### アプリケーションの基本ディレクトリとファイルの作成

```bash
mkdir src/shared && mkdir src/shared/typeorm
mkdir src/common && mkdir src/common/envs && mkdir src/common/helper
```

```bash
touch src/shared/typeorm/typeorm.service.ts
touch src/common/envs/.env
touch src/common/envs/development.env
touch src/common/helper/env.helper.ts
```

#### 各ディレクトリの説明

- src: アプリケーションソースを格納する
    - shared: 
        - typeorm: 
            - typeorm.service.ts: 
    - common: 
        - envs: 
            - .env: 
            - development.env: 
        - helper: 
            - env.helper.ts: 

#### 環境設定ファイル群をTypeScriptの出力ディレクトリ(`dist/`)へ追加する

`nest-cli.json`ファイルを以下のように変更し、

[NestJS -- CLI command reference](https://docs.nestjs.com/cli/usages#nest-generate)