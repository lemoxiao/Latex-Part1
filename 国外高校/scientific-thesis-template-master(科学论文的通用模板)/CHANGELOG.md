# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [unreleased]

### Changed
- Enabled line breaks in long urls (which are not separated by spaces or slashes) in the bibliography.

## [2.0.1] - 2017-12-19

### Added
- Added homepage at <https://github.com/latextemplates/scientific-thesis-template> containing rendered examples created by CircleCI.
- Added [Markdown Architectural Decision Records](https://adr.github.io/madr/) to `docs/adr` folder.

### Changed
- Microtype is now loaded with `babel=true` option. This should lead to even better micro-typographic results.
- Refined styleguide in `config.tex`.
- Refined `README.md`.

### Fixed
- Fix typo in "Bachelor" in `main-paderborn-*.tex`.

## [2.0.0] - 2017-12-18

### Added
- `main-paderborn-english.tex` and `main-paderborn-german.tex`- start documents for Paderborn University.
- `main-english.tex` - start document for English documens

### Fixed
- Remove outdated section "Using with your own git repository"

### Changed
- The main file for works is `main-german.tex` for German documents.
- No text content in sub files. Most users do not need the split. Advanced users can split the content by themselves.
- All configuration files put in the root folder.
- Remove "CR classification" from `uni-stuttgart-cs-cover.sty`.
- git tags now without `v` prefix.
- Change license to [CC0](https://creativecommons.org/publicdomain/zero/1.0/) to ensure wide use.

## [1.3.0] - 2017-12-11

### Added
- New course "Medieninformatik" (`medinf`)

### Fixed
- Translate float name of 'Algorithmus' environment in English thesis
- Translate float name of 'algorithm' environment only in German thesis

### Changed
- The repository uses the branch `master` as default branch and not `template` anymore.

## [1.2.0] - 2017-07-28

### Changed

- Fixed non-inline todos
- Use German name for 'list of todos' in German thesis

## [1.1.0] - 2017-07-22

### Changed

- English works also take the same heading style than German works (sans serif)
- made font size default again (now 11pt instead of 12pt) to look better
- margins are set in a way that the page content does not "jump" when reading on screen.

## 1.0.0 - 2017-06-16

### Changed

- Start versioning based on the current version at 1.0.0.
- Add initial [CONTRIBUTING.md](CONTRIBUTING.md).
- `number` for a thesis is now completely optional.

[Unreleased]: https://github.com/latextemplates/scientific-thesis-template/compare/2.0.1...HEAD
[2.0.1]: https://github.com/latextemplates/scientific-thesis-template/compare/2.0.0...2.0.1
[2.0.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.2.0...2.0.0
[1.3.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/latextemplates/scientific-thesis-template/compare/v1.0.0...v1.1.0
