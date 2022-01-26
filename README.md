# Shiori

[![CI](https://github.com/fmartingr/shiori/workflows/CI/badge.svg)](https://github.com/fmartingr/shiori/actions?query=workflow%3ACI)
[![Go Report Card](https://goreportcard.com/badge/github.com/fmartingr/shiori)](https://goreportcard.com/report/github.com/fmartingr/shiori)

Shiori is a simple bookmarks/read-later manager written in the Go language intended as a simple clone of [Pocket][pocket]/[instapapter][instapaper]. You can use it as a command line application or as a web application. This application is distributed as a single binary, which means it can be installed and used easily.

![Screenshot][screenshot]

## Features

- Basic bookmarks management i.e. add, edit, delete and search.
- Import and export bookmarks from and to Netscape Bookmark file.
- Import from Pocket.
- Simple and clean command line interface.
- Simple and pretty web interface for those who don't want to use a command line app.
- Portable, thanks to its single binary format.
- Support for sqlite3, PostgreSQL and MySQL as its database.
- Where possible, by default `shiori` will parse the readable content and create an offline archive of the webpage.
- [BETA] [web extension][web-extension] support for Firefox and Chrome.

## Documentation

All documentation is available under the [docs][docs] folder. If you think there is incomplete or incorrect information, feel free to submit a patch.

## License

Shiori is distributed under the terms of the [MIT license][mit], which means you can use it and modify it however you want. However, if you make an enhancement for it, if possible, please send a pull request.

[mit]: https://choosealicense.com/licenses/mit/
[web-extension]: https://github.com/go-shiori/shiori-web-ext
[screenshot]: https://raw.githubusercontent.com/go-shiori/shiori/master/docs/readme/cover.png
[mode-comparison]: https://raw.githubusercontent.com/go-shiori/shiori/master/docs/readme/comparison.png
[pocket]: https://getpocket.com/
[instapaper]: https://instapaper.com
[docs]: ./docs
