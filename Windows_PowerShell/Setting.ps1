$server = Read-Host 'プロキシサーバーを指定してください(http:// も含めてください)'
$port = Read-Host 'ポート番号を入力してください'

$netsh = 'netsh winhttp set proxy proxy-server="' + $server + ':' + $port + '"'
$git = 'git config --global http.proxy ' + $server + ':' + $port

$netsh | Out-File ./Start-Proxy.ps1
Write-Output $git >> ./Start-Proxy.ps1

Write-Output "Write-Output 'プロキシの設定を行いました。'" >> ./Start-Proxy.ps1
Write-Output "Write-Output '問題が起こった場合は「管理者として実行」を行ってください。'" >> ./Start-Proxy.ps1
Write-Output "Read-Host 'ボタンを押すとファイル作成プログラムを終了します... '" >> ./Start-Proxy.ps1

Write-Output "プロキシサーバーを介してGitHubの操作を行うファイルを作成しました。"
Read-Host "ボタンを押すとファイル作成プログラムを終了します... "
