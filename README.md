# Static Sphinx

A self-contained static linked build of sphinx-doc with the following extensions:

- Furo Theme 
- Rinohtype
- Myst Parser

## Dependencies

Install Python with `pip` and `patchelf`

1. Create a Python virtual environment inside this repo

```shell
python3 -m venv .venv
```

2. Install the sphinx dependencies

```shell
. .venv/bin/activate
pip install -U sphinx furo myst-parser rinohtype sphinx-autobuild
```

3. Install **pyinstaller** and **staticx**

```shell

pip install -U pyinstaller staticx
```


## Build

Run the `./build.sh` script


## Install and usage

Copy `dist/sphinx` inside a directory inside your `PATH` 
and create the following symlinks:

```shell

ln -s sphinx sphinx-quickstart
ln -s sphinx sphinx-build
ln -s sphinx sphinx-autobuild
```

you can now use the program like this

```shell
sphinx {build|quickstart|autobuild} [--help] ...
```
or by running directly `sphinx-build`, `sphinx-quickstart`. `sphinx-autobuild`  
as you normally would in a traditional install
