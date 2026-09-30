#!/bin/sh 

set -e

patchelf --version > /dev/null 2>&1 || {
  echo "ERROR: patchelf not found"
  exit 1
}

if [ ! -f .venv/bin/activate ]; then
  python3 -m venv .venv
  . .venv/bin/activate
  pip install -U pip
  pip install -U sphinx furo myst-parser rinohtype sphinx-autobuild
  pip install -U pyinstaller staticx
fi

. .venv/bin/activate

pyinstaller --onefile --name sphinx \
  --collect-all sphinx \
  --collect-all myst_parser \
  --collect-all furo \
  --collect-all rinohtype \
  --collect-all rinoh \
  --collect-all sphinx_basic_ng \
  --collect-all pygments \
  --collect-all a11y_pygments \
  --collect-all rinoh_typeface_texgyreheros \
  --collect-all rinoh_typeface_texgyrecursor \
  --collect-all rinoh_typeface_texgyrepagella \
  --collect-all rinoh_typeface_dejavuserif \
  launcher.py

staticx dist/sphinx dist/sphinx.static
