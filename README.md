# Linters for Lido projects

This is the place where GitHub actions and workflows with linters live

### ✅ Released for now:

- 👮 Generic security checks
- 🐍 Python
- 🐳 Docker
- 🚀 GitHub Actions
- ✅ TODOs

### 🛠 Will be done in the future:

- 🪄 JS/TS
- 🦀 Rust
- 🐹 Go
- ➕ C/C++
- ???

## Minimal recommended workflow
This is workflow with 80% efficiency and 20% effort to implement it. 
Just copy it to `.github/workflows` directory in your project and get at least security checks
```yaml
name: Static Checks

on: push

jobs:
  security:
    uses: lidofinance/linters/.github/workflows/security.yml@master
  actions:
    uses: lidofinance/linters/.github/workflows/actions.yml@master
  docker:
    uses: lidofinance/linters/.github/workflows/docker.yml@master
  # drop next job if python is not used in your project
  python:
    uses: lidofinance/linters/.github/workflows/python.yml@master
    with:
      security-only: true
```

### 👮 Generic Security Checks
It's:
- [semgrep](https://semgrep.dev) with a several custom rules that detects following cases:
  - generic secrets
  - github access token
  - google api key, gcp account and oauth
  - password in url
  - private key
  - slack access token and hooks
  - telegram api key
- [trufflehog](https://github.com/trufflesecurity/trufflehog) with the default config
- [CodeQL](https://codeql.github.com) only for public repos

Feel free add your custom security rules if you find them useful for everyone.
Just add a rule similarly to the [rules](.github/actions/lint-security/rules)

You can use it as a workflow or an action, as you wish.
```yaml
jobs:
  # As a workflow
  security:
    uses: lidofinance/linters/.github/workflows/security.yml@master
  
  # Or as an action
  security-action:
    name: Check security issues
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: lidofinance/linters/.github/actions/lint-security@master
```

### 🐍 Python
There are a several tools:
- [Pylint](http://pylint.pycqa.org) for code style and errors
- [Black](http://black.readthedocs.io) for autoformatting
- [ISort](https://github.com/PyCQA/isort) for imports ordering
- [Bandit](http://bandit.readthedocs.io) for common python security issues

You can use it as a workflow or an action, as you wish.
```yaml
jobs:
  # As a workflow
  python:
    uses: lidofinance/linters/.github/workflows/python.yml@master
  
  # Or as an action
  python-action:
    name: Check python codestyle and security issues
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.9

      - name: Install requirements
        run: pip install -r requirements.txt

      - uses: lidofinance/linters/.github/actions/lint-python@master
```

Python workflow and action can be customized with some inputs:
- **dirs** - specify directories with python code to be checked. Default is `./`
- **security-only** - don't check codestyle, only security issues. Default is false
- **pylint-args** - custom pylint options. Empty by default
- **python-version** _(workflow only)_ - specify your python version. Default is 3.10.*
- **requirements-file** _(workflow only)_ - requirements.txt location if you don't use poetry and has custom file location or name


### 🐳 Docker
At the moment it's just a [hadolint](https://github.com/hadolint/hadolint) tool with default configuration.

You can use it as a workflow or an action, as you wish.
```yaml
jobs:
  # As a workflow
  docker:
    uses: lidofinance/linters/.github/workflows/docker.yml@master
  
  # Or as an action
  docker-action:
    name: Check docker issues
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: lidofinance/linters/.github/actions/lint-docker@master
```

### 🚀 GitHub Actions
[actionlint](https://github.com/rhysd/actionlint) used

You can use it as a workflow or an action, as you wish.
```yaml
jobs:
  # As a workflow
  docker:
    uses: lidofinance/linters/.github/workflows/actions.yml@master
  
  # Or as an action
  actions:
    name: Check GitHub Actions issues
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: lidofinance/linters/.github/actions/lint-actions@master
```
