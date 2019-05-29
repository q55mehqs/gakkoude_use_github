$server = Read-Host 'プロキシサーバーを指定してください(http:// も含めてください)'
$port = Read-Host 'ポート番号を入力してください'

$netsh = 'netsh winhttp set proxy proxy-server="' + $server + ':' + $port + '"\r\n'
$git = 'git config --global http.proxy ' + $server + ':' + $port

$netsh | Out-File ./Start-Proxy.ps1
Write-Output $git >> ./Start-Proxy.ps1
