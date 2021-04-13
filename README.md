# python-lint-annotate

Zero-configuration GitHub Action to maintain code quality with push and PR annotations.

On every push and pull request git diffs will get inline annotated with found errors from
selected linters.

![Screenshot of annotations](static/annotations.png)

## Features

- Zero configuration based: Add a single line in your CI and done!
- GitHub Annotations on PR: Highlights issues inline on the PR diff.
- Most of the popular community trusted linters in one place.

## Linters supported

- [black](https://github.com/psf/black)
- [flake8](http://flake8.pycqa.org)
- [isort](https://github.com/timothycrosley/isort)
- [mypy](http://mypy-lang.org/)
- [pylint](https://www.pylint.org/)
- [pycodestyle](https://pycodestyle.readthedocs.io)
- [vulture](https://github.com/jendrikseipp/vulture)
- [pydocstyle](https://github.com/PyCQA/pydocstyle)

## Usage

Basic:

```yml
steps:
  - uses: actions/checkout@v1
  - uses: marian-code/python-lint-annotate@v2.5.0
```

Options:

```yml
steps:
  - uses: actions/checkout@v1
  - uses: marian-code/python-lint-annotate@v2.5.0
    with:
      python-root-list: "src/ tests/*"  # accepts wildcards
      use-pycodestyle: false
      use-mypy: false
      use-vulture: true
      extra-pylint-options: "--output-format="colorized"
      conda-python-version: "3.7"
```

## Details

Uses conda environment with user selected python version. Only python `3.6` - `3.9`
version are tested since they are by far most common now. Other python `3.x` versions
should also work. Any python `2.x` versions are unsupported!

The lintner versions are:

```bash
pycodestyle==2.6.0
pydocstyle==5.1.1
pylint==2.6.0
mypy==0.800
black==20.8b1
flake8==3.8.4
vulture==2.3
isort==isort-5.7.0
```

## IMPORTANT - test environment

The python version you set up in your action script with `actions/setup-python@v2`
or by other means will not affect the linting process. The python version used by
the linters can be set up only by `conda-python-version` argument! This also means
that if you modify the system conda environment it might affect the lintnig process.
So it is best to keep the lintnig action separated from others. It is also recomended
to run this on `ubuntu-latest`. Example:

```yml
on:
  push:
  pull_request:
name: Lint Python
jobs:
  lintpython:
    name: Lint Python
    runs-on: ubuntu-20.04
    steps:
    - uses: actions/checkout@v1
    - uses: marian-code/pyaction@v2.5.0
      with:
        python-root-list: "./tests/*.py"
        use-black: true
        use-isort: true
        use-mypy: true
        use-pycodestyle: true
        use-pydocstyle: true
        extra-pycodestyle-options: "--max-line-length=88"
        use-pylint: false
        use-flake8: false
        use-vulture: true
        conda-python-version: "3.8"
```

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE)

## Contributions

Contributions are welcome through PRs.

## TODO

Wait until this is resolved: [PR646](https://github.com/actions/runner/issues/646)
so we can implement better python version control
