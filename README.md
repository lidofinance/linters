# Linters for Lido projects

This is GitHub actions and workflows with linters

### ✅ Released for now:

- 👮 Generic security checks
- 🐍 Python

### 🛠 Will be done in the future:

- 🪄 JS/TS
- 🦀 Rust
- 🐹 Go
- ???

### 👮 Generic Security Checks
It's [semgrep](https://semgrep.dev) with a several custom rules that detects following cases:
- generic secrets
- github access token
- google api key, gcp account and oauth
- password in url
- private key
- slack access token and hooks
- telegram api key

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
      - uses: actions/checkout@v2
      - uses: lidofinance/linters/.github/actions/lint-security@master
```

### 🐍 Python
There are a several tools:
- [Pylint](http://pylint.pycqa.org) for code style and errors
- [Black](http://black.readthedocs.io) for autoformatting
- [ISort](https://github.com/PyCQA/isort) for imports ordering
- [Bandit](http://bandit.readthedocs.io) for common python security issues (via semgrep)

You can use it as a workflow or an action, as you wish.
```yaml
jobs:
  # As a workflow
  security:
    uses: lidofinance/linters/.github/workflows/python.yml@master
  
  # Or as an action
  security-action:
    name: Check security issues
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: lidofinance/linters/.github/actions/lint-python@master
```
