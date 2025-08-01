$env:EDITOR = "nvim"

$env:HTTP_PROXY = "http://127.0.0.1:7890"


$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()

Invoke-Expression (& { (zoxide init powershell | Out-String) })


function catbox {
    param([string]$FilePath)
    & "~/scripts/upload-catbox.ps1" $FilePath
}

function news {
    param(
        [string]$param = "60s"
    )
    $url = "https://60s.viki.moe/v2/{0}?encoding=text" -f $param
    $response = Invoke-WebRequest -Uri $url -Method Get
    $response.Content
}


function form {
    $response = Invoke-RestMethod -Uri 'https://api.tally.so/forms' `
      -Headers @{ Authorization = 'Bearer tly-Mi5dQgRu6GfxlOZei2AXgHtRsbwBtSRj' } `
      -Method Get

    $response.items | ForEach-Object {
        [PSCustomObject]@{
            URL  = "https://tally.so/r/$($_.id)  "
            Name = $_.name
        }
    } | Format-Table -AutoSize
}


Invoke-Expression (&starship init powershell)
