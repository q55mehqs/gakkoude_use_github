## PowerShell でのつかいかた

### 注意

学校のプロキシサーバーのURLを公開するのはさすがにまずそうなのでここでの公開は控えます。
{school_proxy} と書かれている部分は、適宜学内LANのプロキシサーバーアドレスに置き換えて
この文を読んでください。


### 事前設定

利用するリポジトリのremoteアドレスに、HTTPを登録してください。

使用しているリポジトリがHTTPであればこの操作は必要ありません。

```
PS> git remote add school https://github.com/{username}/{repo}.git
```


### クローン(校外の場合)

普通に適当なディレクトリに当リポジトリをクローンしてください。

```
PS> git clone https://github.com/q55mehqs/gakkoude_use_github.git
```


### クローン(校内の場合)

PowerShellを管理者として実行し、下記コマンドを実行してください。

```
PS(admin)> netsh winhttp set proxy proxy-server="{proxy_server}"
PS(admin)> git config --global http.proxy {proxy_server}
```

そうするとGitHubとのGitリモートリポジトリ操作ができるようになるので、
(必要に応じて別ターミナルを立ち上げて)このリポジトリをクローンしてください。

```
PS> git clone https://github.com/q55mehqs/gakkoude_use_github.git
```


### ショートカット作成・編集

クローンした `Settings.ps1` のショートカットを作成してください。

作成したショートカットを右クリックし、`プロパティ(R)` を選んでください。

`リンク先(T)` の文字列の先頭に下記文字列を加えてください。

```
powershell -NoProfile -ExecutionPolicy Unrestricted 
```

作成したショートカットを右クリックして、「管理者として実行」を選んでください。

開いたコマンドプロンプトのガイドに沿ってアドレスなどを入力してください。

---

このの操作で作成された`Start-Proxy.ps1`と、クローンされたファイル内にある
`Stop-Proxy.ps1`を、`Settings.ps1`と同様にショートカット作成してください。


### 学校内でプロキシ設定

「Start-Proxy」の作成したリンクを右クリックして「管理者として実行」を選択してください。

これで、GitHubのリモートリポジトリと通信を行うことができるようになっているはずです。
ターミナルを別に開いたのち

```
PS> netsh winhttp show proxy
```

と入力して、`プロキシ サーバー:` の後ろのアドレスが書き換わってるのを確認してください。

学校のプロキシサーバーに書き換わっているのを確認できたら、
作業ディレクトリに戻り、GitHubでの操作を行ってください。

```
PS> Set-Location {Gitを使用するディレクトリ}　# Set-Location=cd
PS> git fetch
PS> git push school master
```


### 学内LAN以外の環境に戻すとき

「Stop-Proxy」の作成したリンクを右クリックして「管理者として実行」を選択してください。

プロキシサーバーを経由しない通信で操作できる環境に戻ります。

### 参考
[PowerShellの使い方(OS設定編)](https://qiita.com/Kirito1617/items/aed439bcb66c63489337#3-%E3%83%97%E3%83%AD%E3%82%AD%E3%82%B7%E8%A8%AD%E5%AE%9A)

[GitコマンドをProxy環境可で利用する。](https://qiita.com/ryotaro76/items/0e40ffb6173b1580e671)
