![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![version](https://img.shields.io/github/v/tag/baudee/pre-commit-msg?label=version)


# Conventional pre-commit hook
A [pre-commit](http://pre-commit.com/) hook to follow the [Conventional commits](http://pre-commit.com/).

Add the following in your `.pre-commit-config.yaml` and run `pre-commit install --hook-type commit-msg` to install the hook:

```
- repo: https://github.com/baudee/pre-commit-msg
  rev: v1.0.0
  hooks:
    - id: pre-commit-msg
```