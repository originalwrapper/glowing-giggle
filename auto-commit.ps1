$root = "C:\Users\origi\Documents\glowing-giggle"
$log  = "$root\auto-commit.log"

try {
    git --version > $null 2>&1
    if ($LASTEXITCODE -ne 0) {
        "$([datetime]::Now.ToString('s')) ERROR: git.exe not found" | Out-File -Append -FilePath $log -Encoding UTF8
        exit 1
    }

    # ここから通常処理
    Set-Location $root
    "$([datetime]::Now.ToString('s')) Commit started" | Out-File -Append -FilePath $log -Encoding UTF8
    git add .
    git commit -m "Auto commit at $([datetime]::Now.ToString('s'))"
    git push
    "$([datetime]::Now.ToString('s')) Commit finished" | Out-File -Append -FilePath $log -Encoding UTF8

} catch {
    "$([datetime]::Now.ToString('s')) ERROR: $_" | Out-File -Append -FilePath $log -Encoding UTF8
}
