#!/bin/sh 

set -e

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
