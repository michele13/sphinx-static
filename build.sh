#!/bin/bash

pyinstaller --onefile --name sphinx \
  --collect-all sphinx \
  --collect-all myst_parser \
  --collect-all furo \
  --copy-metadata rinohtype \
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
