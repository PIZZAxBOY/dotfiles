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

def news [param?: string = "60s"] {
    let url = $"https://60s.viki.moe/v2/($param)?encoding=text"
    http get $url
}

def form [] {
    let response = http get -H [Authorization "Bearer tly-Mi5dQgRu6GfxlOZei2AXgHtRsbwBtSRj"] https://api.tally.so/forms
    $response.items | each { |item| { URL: $"https://tally.so/r/($item.id)", Name: $item.name } } | table
}

def wttr [param] {
    let url = $"https://v2d.wttr.in/($param)"
    http get $url
}
