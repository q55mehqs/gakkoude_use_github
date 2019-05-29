git config --global --unset http.proxy
netsh winhttp reset proxy

Write-Output 'プロキシの設定を行いました。'
Write-Output '問題が起こった場合は「管理者として実行」を行ってください。'
Read-Host 'ボタンを押すとファイル作成プログラムを終了します... '
