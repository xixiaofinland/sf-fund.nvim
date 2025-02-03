# Changelog

## [1.9.1](https://github.com/xixiaofinland/sf.nvim/compare/v1.9.0...v1.9.1) (2025-02-03)


### Bug Fixes

* fix quotes and expand issue on highlight soql ([37b83c9](https://github.com/xixiaofinland/sf.nvim/commit/37b83c90fb1c8800511a3c17cadde84dbb47088c))
* improve fetch org list performance ([eab38b9](https://github.com/xixiaofinland/sf.nvim/commit/eab38b921ab6e4ae22a3ecff9d645239384bbeea))
* missing plugin parent dir causes unrecoverable failure ([ab92f64](https://github.com/xixiaofinland/sf.nvim/commit/ab92f647c26833ccabc3415fd2259da70f4281eb))
* wrap target org in quotes for aliases with spaces ([38d625c](https://github.com/xixiaofinland/sf.nvim/commit/38d625c72f44fbba86ec8b93c2093911822fa127))

## [1.9.0](https://github.com/xixiaofinland/sf.nvim/compare/v1.8.0...v1.9.0) (2024-11-16)


### Features

* add md type to table key ([1b9529a](https://github.com/xixiaofinland/sf.nvim/commit/1b9529a91df9c17df7ec774e4f511efe40cd0823))
* add tests for non-expanded params ([63cc48b](https://github.com/xixiaofinland/sf.nvim/commit/63cc48b72dbcc8b79b433d44bf8679c96e13b94f))
* allow for some params to not be expanded ([6090f64](https://github.com/xixiaofinland/sf.nvim/commit/6090f64a91166813600125a79cc48d98969f6789))
* don't ignore metadata that doesn't have unmanaged ([882efdd](https://github.com/xixiaofinland/sf.nvim/commit/882efdddef3db67d21ea2fdd63939b860eb6da4e))
* make addParamsNoExpand method ([840136c](https://github.com/xixiaofinland/sf.nvim/commit/840136c00c1421105918d6eb630e39db6ef5647a))
* make sf wait time configurable ([2eab01e](https://github.com/xixiaofinland/sf.nvim/commit/2eab01e4c862a6863651984cf7f76a6d82c25eca))


### Bug Fixes

* pulling was adding type to name ([d694f29](https://github.com/xixiaofinland/sf.nvim/commit/d694f2933898a1e76691ebd9854f849e7d4560e2))
* remove double slashes from dirs ([846a574](https://github.com/xixiaofinland/sf.nvim/commit/846a574de0b891f192597a9d18b30d27025f7e19))
* windows check always returns true ([d47fc7f](https://github.com/xixiaofinland/sf.nvim/commit/d47fc7ffcf815d6dc9a6ff9565432347c1b4bf9d))
* Windows OS cmd with echo ([99462a5](https://github.com/xixiaofinland/sf.nvim/commit/99462a5bba9380d21e2b97a2e025568d28db7dbc))
* Windows root path formatting ([51ead9a](https://github.com/xixiaofinland/sf.nvim/commit/51ead9a68ff91d3620787e1f5863eb65b1cebaa8))

## [1.8.0](https://github.com/xixiaofinland/sf.nvim/compare/v1.7.0...v1.8.0) (2024-10-03)


### Features

* add create trigger methods to md ([78a2d9b](https://github.com/xixiaofinland/sf.nvim/commit/78a2d9b210aff302c8b429415c7e9278bed5c8ce))
* add create_trigger to init and user_commands ([bd3ab9e](https://github.com/xixiaofinland/sf.nvim/commit/bd3ab9e12aaedebeaf70d8e702fd0952de7c0724))
* allow extra params in several common functionalities ([#253](https://github.com/xixiaofinland/sf.nvim/issues/253)) ([479e083](https://github.com/xixiaofinland/sf.nvim/commit/479e0833b21ea44018a4501ddba6cc6f2fa9a846))
* change how tables are converted to strings ([730d6ee](https://github.com/xixiaofinland/sf.nvim/commit/730d6eef6701eb288d60e99dd2e100384225383f))
* create util methods for system calls ([219eefa](https://github.com/xixiaofinland/sf.nvim/commit/219eefa468232fddc16a200562b985e5833dffff))
* make test signs enabled by default ([2d81c89](https://github.com/xixiaofinland/sf.nvim/commit/2d81c89cfef3b63245a10927472692eebb64b95e))
* reduce from 6 regex to 4 ([4a923c7](https://github.com/xixiaofinland/sf.nvim/commit/4a923c7e71fdb8387e511dbded6f7a47d6a2a77d))


### Bug Fixes

* don't return boolean if there's no coverage ([f69f8e5](https://github.com/xixiaofinland/sf.nvim/commit/f69f8e5c1a164a845aa6f3f278ce5fce550b7a56))
* dont fail validate cmd for local only ([969ef64](https://github.com/xixiaofinland/sf.nvim/commit/969ef6456d76c2a3f9d6af913a8888135c1c37f2))
* only default enable code signs if in project ([1501684](https://github.com/xixiaofinland/sf.nvim/commit/1501684f3e4254178172d3aef3ffc0ca6319b6cd))

## [1.7.0](https://github.com/xixiaofinland/sf.nvim/compare/v1.6.0...v1.7.0) (2024-09-25)


### Features

* add buildAsTable to CommandBuilder ([58686b4](https://github.com/xixiaofinland/sf.nvim/commit/58686b4796d5027d70534f3c7e904adec4665040))
* add cmd shortcut for run all tests ([e938fe7](https://github.com/xixiaofinland/sf.nvim/commit/e938fe798b8da22f9c2a8e4c22d47c07313f4023))
* add download and open log file ([d90ac39](https://github.com/xixiaofinland/sf.nvim/commit/d90ac39976aebb27a2194a3c8d078d9eb7f51209))
* add empty org guard to md pull ([2c13993](https://github.com/xixiaofinland/sf.nvim/commit/2c139932ea449e1c7288cb6910df556af0e7bce8))
* add subactions to CommandBuilder ([b362541](https://github.com/xixiaofinland/sf.nvim/commit/b3625414c83533844a9c0f7c60528566f74a177d))
* add support to run jest tests ([f581a42](https://github.com/xixiaofinland/sf.nvim/commit/f581a426d5c80968f450bedc0beaee15588dddb5))
* add warning if no logs found ([74c93ba](https://github.com/xixiaofinland/sf.nvim/commit/74c93ba08a4afd9cfd0fec2f6d6198445c580c97))
* change print to vim.notify ([1ce9069](https://github.com/xixiaofinland/sf.nvim/commit/1ce9069968abd04e17ef2aaf74587426d703bdb6))
* change pull_logs to pull_log ([15d7d21](https://github.com/xixiaofinland/sf.nvim/commit/15d7d2107c6d3ba405cfe8c977711b991a89d84f))
* create init hook for pull_logs ([d24c67f](https://github.com/xixiaofinland/sf.nvim/commit/d24c67f8ffa82f7241be23053f08c96923b72fc3))
* fix open file in org command in help ([43a4426](https://github.com/xixiaofinland/sf.nvim/commit/43a4426df2474e64203dfeea20e88c2e1f62687d))
* force open retrieved file ([7abcaa0](https://github.com/xixiaofinland/sf.nvim/commit/7abcaa04dd103a5f13169edf75d04b43b616c84f))
* further sanitize paths ([71e44d8](https://github.com/xixiaofinland/sf.nvim/commit/71e44d8a1b790a614c93b49a8fd98ccadd2d31c1))
* list logs in fzf-lua ([c10e0d4](https://github.com/xixiaofinland/sf.nvim/commit/c10e0d4bde5ca5e19ebbca8185bcc717a90ee6ea))
* remove surrounding quotes from params in cmd table ([9a4bed3](https://github.com/xixiaofinland/sf.nvim/commit/9a4bed34f2cb2ee1c56563054c7ca4dc7fb465a6))


### Bug Fixes

* extra end in cmd_builder ([53ff298](https://github.com/xixiaofinland/sf.nvim/commit/53ff2986dcda54230eaf80aac9b9da65fb4f5899))
* gsub ([a6e2c5c](https://github.com/xixiaofinland/sf.nvim/commit/a6e2c5c9a36131fc045cf3b4d27462097f657ec3))
* remove extra line causing tests to fail ([947407e](https://github.com/xixiaofinland/sf.nvim/commit/947407e2c43b443657a3f33298808f156997fb7d))

## [1.6.0](https://github.com/xixiaofinland/sf.nvim/compare/v1.5.0...v1.6.0) (2024-09-12)


### Features

* update readme ([a416bd6](https://github.com/xixiaofinland/sf.nvim/commit/a416bd6224c80fd2dd8efa6b3edd032e4323d0c6))


### Bug Fixes

* add async msg for async calls without original msg ([fc19528](https://github.com/xixiaofinland/sf.nvim/commit/fc1952894bef850badf5112914cbcf4a3f27eaba))
* apex, aura creation command failure ([c7e79f3](https://github.com/xixiaofinland/sf.nvim/commit/c7e79f3a9f034df7b210323c3217ef52a15ef9da))
* cmd wrong name ([72d62dc](https://github.com/xixiaofinland/sf.nvim/commit/72d62dcdb422f959e6db54f6624d4a54e9b4fb1c))
* create lwc ([32cdb3b](https://github.com/xixiaofinland/sf.nvim/commit/32cdb3b16a1c329ef16445e3b5e8cfe6fd3275f2))
* keys not enabled in sf project sub folder ([082a740](https://github.com/xixiaofinland/sf.nvim/commit/082a7402dfaed8a8cd0f12c25d498f0f4f58ab57))
* keys not enabled in sf project sub folder ([1b27dee](https://github.com/xixiaofinland/sf.nvim/commit/1b27dee3db1bc762f8f1ef026936dda56e93c6ed))
* metadata pull command ill-formatted ([ef04a37](https://github.com/xixiaofinland/sf.nvim/commit/ef04a379c5b33475c3b1ed4ce1482a756014d24c))
* remove debug_print ([6aa7809](https://github.com/xixiaofinland/sf.nvim/commit/6aa780979d13a407c619cd3e9e9a7b5573f807fe))
* show once warning when md file is not found locally ([291881b](https://github.com/xixiaofinland/sf.nvim/commit/291881b27bd6e2b93a2866b4b3d29d508f576706))

## [1.5.0](https://github.com/xixiaofinland/sf.nvim/compare/v1.4.0...v1.5.0) (2024-08-13)


### Features

* add sflog parser support ([a042171](https://github.com/xixiaofinland/sf.nvim/commit/a042171a5963429249cafd2b7b6068425ded1a5d))
* disable default hotkeys in the default config setup ([e774165](https://github.com/xixiaofinland/sf.nvim/commit/e77416555de8796b72663524013c61f5b179a433))


### Bug Fixes

* set target_org errored ([74f0d7e](https://github.com/xixiaofinland/sf.nvim/commit/74f0d7ecfd74ecb3dfdb4d8c994b2d794f634145))

## [1.4.0](https://github.com/xixiaofinland/sf.nvim/compare/v1.3.1...v1.4.0) (2024-08-06)


### Features

* add GH action for publishing in luarocks ([95f8941](https://github.com/xixiaofinland/sf.nvim/commit/95f89418a19058142b821eeac1739bf5965c27ab))

## [1.3.1](https://github.com/xixiaofinland/sf.nvim/compare/v1.3.0...v1.3.1) (2024-07-28)


### Bug Fixes

* elinimate warning in autocmd ([797ffef](https://github.com/xixiaofinland/sf.nvim/commit/797ffefdd5d13b126651bdb1716dba2bec4d35cf))

## [1.3.0](https://github.com/xixiaofinland/sf.nvim/compare/v1.2.2...v1.3.0) (2024-07-27)


### Features

* add a util func to generate help.txt automatically ([7b7a7c1](https://github.com/xixiaofinland/sf.nvim/commit/7b7a7c15c0a81687602237a18d2f7a245df81825))
* add gh action for running unit tests ([7a2a171](https://github.com/xixiaofinland/sf.nvim/commit/7a2a17191605d38d7cd80ee9d07c30f38b5492db))
* add new configuration option to disable auto run fetch_org_list ([c0a004a](https://github.com/xixiaofinland/sf.nvim/commit/c0a004a072fdb948fca5a7504dd3a30b33fe9d70))
* update error msg to include a warning at begining ([2ac3c0c](https://github.com/xixiaofinland/sf.nvim/commit/2ac3c0cb5708373878d792264d1948922606bdad))


### Bug Fixes

* **ctags:** use default_dir config to generate tag file ([ac80b49](https://github.com/xixiaofinland/sf.nvim/commit/ac80b49f0cdfb183a161bfb079f07e047c08df31))
* test-open feature still opens the window when no tests ([25cea43](https://github.com/xixiaofinland/sf.nvim/commit/25cea43986e9c258e2e1603ffe62bba6aa2b81d2))
* test-open with code coeverage doesn't save test result ([354ebd5](https://github.com/xixiaofinland/sf.nvim/commit/354ebd585f77c61f04fddc2d47004db1bd898182))
