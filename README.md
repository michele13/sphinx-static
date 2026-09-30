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


## Building

Run the `./build.sh` script


