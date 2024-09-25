#!/bin/bash

ln -s okular/okularpartrc          ../okularpartrc
ln -s "$HOME/.config/okular/own"   "$HOME"/.local/share/okular/shortcuts/own

cat << EOF >> ../okularrc

[Shortcut Schemes]
Current Scheme=own
EOF
