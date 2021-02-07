<h1 align="center">
	<a href="https://github.com/WolfSoftware">
		<img src="https://raw.githubusercontent.com/WolfSoftware/branding/master/images/general/banners/64/black-and-white.png" alt="Wolf Software Logo" />
	</a>
	<br>
	Pycodestyle for Travis
</h1>


<p align="center">
	<a href="https://travis-ci.com/TravisToolbox/pycodestyle">
		<img src="https://img.shields.io/travis/com/TravisToolbox/pycodestyle/master?style=for-the-badge&logo=travis" alt="Build Status">
	</a>
	<a href="https://github.com/TravisToolbox/pycodestyle/releases/latest">
		<img src="https://img.shields.io/github/v/release/TravisToolbox/pycodestyle?color=blue&style=for-the-badge&logo=github&logoColor=white&label=Latest%20Release" alt="Release">
	</a>
	<a href="https://github.com/TravisToolbox/pycodestyle/releases/latest">
		<img src="https://img.shields.io/github/commits-since/TravisToolbox/pycodestyle/latest.svg?color=blue&style=for-the-badge&logo=github&logoColor=white" alt="Commits since release">
	</a>
	<a href="LICENSE.md">
		<img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" alt="Software License">
	</a>
	<br>
	<a href=".github/CODE_OF_CONDUCT.md">
		<img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
	<a href=".github/CONTRIBUTING.md">
		<img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
	<a href=".github/SECURITY.md">
		<img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
	<a href=".github/SUPPORT.md">
		<img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge&logo=read-the-docs&logoColor=white" />
	</a>
</p>

## Overview

A tool to check your Python projects for updates in travis-ci pipelines using [pycodestyle](https://pypi.org/project/pycodestyle/).

## Usage

```yml
language: python
rvm: 3.6
before_install:
  - git clone https://github.com/TravisToolbox/pycodestyle
install:
  - ./pycodestyle/install.sh
script:
  - ./pycodestyle/scan.sh
```

## The Scripts

- The [install.sh](install.sh) script will install the pycodestyle python package
- The [scan.sh](scan.sh) script will scan all python files with pycodestyle.

Python scripts are identified using the following code:

```shell
file -b "${filename}" | grep -qE '^Python script'

AND

[[ ${filename} =~ \.py$ ]]

```


## Contributors

<p>
	<a href="https://github.com/TGWolf">
		<img src="https://img.shields.io/badge/Wolf-black?style=for-the-badge" />
	</a>
</p>

## Show Support

<p>
	<a href="https://ko-fi.com/wolfsoftware">
		<img src="https://img.shields.io/badge/Ko%20Fi-blue?style=for-the-badge&logo=ko-fi&logoColor=white" />
	</a>
</p>
