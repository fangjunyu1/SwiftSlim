# Xcode を知る

## Xcode とは

Xcode は Apple が公式に提供している統合開発環境（IDE, Integrated Development Environment）で、iOS、macOS、watchOS、tvOS など Apple プラットフォーム向けアプリの開発に使われます。

![Swift](../../RESOURCE/001_xcode.png)

このチュートリアル全体を通して、私たちは Xcode を使ってコードを書き、プログラムを実行していきます。

このレッスンでは、Xcode のダウンロード方法、最初の iOS アプリの作成方法、そして Xcode の画面構成をひと通り理解することを学びます。

## Xcode をダウンロードする

現在、Xcode には 2 つのインストール方法があります。

1、[Mac App Store](https://apps.apple.com/cn/app/xcode/id497799835?mt=12) からダウンロードする

2、[Apple Developer 公式サイト](https://developer.apple.com/xcode/) からダウンロードする

どちらの方法でも Xcode をダウンロードできます。違いは、Apple Developer 公式サイトでは正式版だけでなく、[Beta](https://developer.apple.com/download/all/?q=Xcode) 版や過去のバージョンもダウンロードできる点です。

学習目的であれば、正式版を使うことをおすすめします。Beta 版は主に新機能のテストに使われるため、不安定な場合があります。

## 最初のプロジェクトを作成する

Xcode を開くと、起動画面が表示されます。

![Swift](../../RESOURCE/001_xcode1.png)

左側にはよく使う 3 つの項目があります。

- Create New Project —— 新しいプロジェクトを作成  
- Clone Git Repository —— Git リポジトリをクローン  
- Open Existing Project —— 既存のプロジェクトを開く

右側には最近開いた Xcode プロジェクトが表示されます。

ここでは "Create New Project" を選びます。

### プロジェクトテンプレートを選ぶ

![Swift](../../RESOURCE/001_xcode2.png)

プロジェクトテンプレート選択画面に入ると、複数のプラットフォーム（iOS、macOS など）と、さまざまな種類のプロジェクトテンプレートが表示されます。

代表的なテンプレートの説明：
- App —— 最も基本的なアプリの種類（推奨）
- Document App —— ドキュメント型アプリ
- Game —— ゲーム開発向け
- Framework —— 再利用可能なモジュール

入門段階では、UI アプリの種類である "iOS" - "App" テンプレートだけを選びます。

"Next" をクリックします。

### プロジェクト情報を入力する

プロジェクト情報入力画面に入ったら、各フィールドの種類に応じて入力していきます。

![Swift](../../RESOURCE/001_xcode3.png)

各項目の意味：

- Product Name —— プロジェクト名。例：SwiftSlimTest
- Team —— 開発者チーム。有料の Apple Developer アカウントがない場合は選択しなくてもかまいません
- Organization Identifier —— 組織識別子。通常は逆ドメイン形式を使います。例：
  - com.yourname
  - com.yourcompany
  - ドメインがない場合は、自分の英語名を識別子として使えます
- Bundle Identifier —— アプリの一意識別子。Organization Identifier と Product Name をもとに自動生成されます
- Interface —— UI 技術。SwiftUI を選択
- Language —— 開発言語。Swift を選択
- Testing System —— デフォルトでテストターゲット（Unit Tests）が作成されますが、初心者の段階では無視してかまいません
- Storage —— ローカルデータ永続化フレームワーク。SwiftData や Core Data を自動統合できますが、初心者の段階では無視してかまいません

入力が終わったら "Next" をクリックします。

### プロジェクトを保存する

![Swift](../../RESOURCE/001_xcode4.png)

適切なフォルダを選んで保存します。

"Create" ボタンをクリックすると、Xcode が自動的にプロジェクト構成を生成します。

## Xcode プロジェクト構成

Xcode プロジェクトを保存すると、Finder 上で生成されたプロジェクトフォルダを確認できます。

![Swift](../../RESOURCE/001_xcode5.png)

- Assets.xcassets —— 画像や App アイコンなどのリソースを保存するフォルダ

- ContentView.swift —— デフォルトで生成される SwiftUI ビューファイル。今後ここで UI コードを書いていきます。

- SwiftSlimTestApp.swift —— アプリのエントリーファイル（App Entry Point）で、アプリの起動を担当します。今はまだ理解しなくても大丈夫です。

- SwiftSlimTest.xcodeproj —— Xcode プロジェクトファイル。これをダブルクリックするとプロジェクトを開けます。

## Xcode の画面を知る

`.xcodeproj` ファイルをダブルクリックしてプロジェクトを開き、左側の Navigator 領域で ContentView.swift ファイルを選択します。

Xcode の画面は主に 5 つの領域で構成されています。

- Navigator —— ナビゲーション領域。ファイル構造の確認や検索に使います
- Editor —— 編集領域。Swift または SwiftUI コードを書く場所です
- Canvas —— キャンバス領域。SwiftUI のプレビューに使います
- Inspector —— プロパティインスペクタ領域。ファイルの属性確認や変更に使います
- Debug Area —— デバッグ領域。ログ出力を確認します

![Swift](../../RESOURCE/001_xcode6.png)

注意：Canvas は主に SwiftUI ビューのプレビューに使われます。Xcode の公式アーキテクチャ上では、Editor の補助的なプレビューパネル（Preview Pane）です。SwiftUI ビューファイルを開いているときだけ Canvas を有効にでき、他の種類のファイルではプレビュー機能は表示されません。

以降のレッスンでは、主に Editor 領域で Swift と SwiftUI のコードを書いていきます。

初めて Xcode プロジェクトを開いたときは、Inspector と Debug Area はデフォルトで非表示になっている場合があります。右上と右下のボタンをクリックすると表示できます。

![Swift](../../RESOURCE/001_xcode7.png)

ヒント：Inspector 領域は主にファイル属性の確認や変更に使われます。実際の開発では、より広い編集スペースを確保するため、この領域を隠して使うことが多いです。

## まとめ

このレッスンでは、Xcode のダウンロード方法、最初の Xcode プロジェクトの作成方法、そして Xcode の基本的な画面レイアウトを学びました。

ここからは自由に触ってみる時間です：
- Navigator 領域でファイルの作成や削除を試してみましょう。  
- Editor 領域のコードを見て、コード構造を観察してみましょう。
- Canvas 領域のボタンを見て、プレビュー画面の拡大・縮小を試してみましょう。

次のレッスンでは、簡単なコードを書き始めて、さらに Xcode への理解を深めていきます。  
