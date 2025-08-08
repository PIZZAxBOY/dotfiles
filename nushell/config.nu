# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.buffer_editor = "nvim"
$env.http_proxy = "http://127.0.0.1:7890"
$env.https_proxy = "http://127.0.0.1:7890"

def news [param?: string = "60s"] {
    let url = $"https://60s.viki.moe/v2/($param)?encoding=text"
    http get $url
}

def form [] {
    let response = http get -H [Authorization "Bearer tly-Mi5dQgRu6GfxlOZei2AXgHtRsbwBtSRj"] https://api.tally.so/forms
    $response.items | each { |item| { URL: $"https://tally.so/r/($item.id)", Name: $item.name } } | table
}

def wttr [param] {
    let url = $"v2d.wttr.in/($param)"
    http get $url
}

def --wrapped scrcpy [...rest] {
    # 如果用户没指定 --max-size 或 -m，则加默认值
    let maxsize = if ('--max-size' in $rest) or ('-m' in $rest) {
        []
    } else {
        ['--max-size=1024']
    }

    # 如果用户没加 -S，则默认加
    let screenOff = if ('-S' in $rest) {
        []
    } else {
        ['-S']
    }

    # 如果用户没设置 window 相关参数，则加默认窗口位置和大小
    let has_window = if ($rest | any {|r| $r =~ '(?i)--window'}) {
        []
    } else {
        ['--window-width=300', '--window-x=30', '--window-y=350' ]
    }

    try {
        # 组合参数并执行 scrcpy
        ^scrcpy ...$maxsize ...$screenOff ...$has_window ...$rest
    } catch {
        # scrcpy 退出后锁屏
        adb shell input keyevent 26
        echo 结束屏幕共享，开始锁屏
    }
}
