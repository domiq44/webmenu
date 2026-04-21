#!/usr/bin/env bash

set -e

# Détecte automatiquement le dossier du projet
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

BIN_DIR="$HOME/bin"
CONF_DIR="$HOME/.config/webmenu"
TEMPLATES_DIR="$CONF_DIR/templates"
SHARE_DIR="$CONF_DIR/share/icons"

echo "Installation de WebMenu v3..."
echo "Dossier source : $BASE_DIR"

mkdir -p "$BIN_DIR"
mkdir -p "$CONF_DIR"
mkdir -p "$TEMPLATES_DIR"
mkdir -p "$SHARE_DIR"

# Copie des scripts
cp "$BASE_DIR/bin/webmenu" "$BIN_DIR/"
cp "$BASE_DIR/bin/webmenu-gui" "$BIN_DIR/"
cp "$BASE_DIR/bin/webmenu-daemon" "$BIN_DIR/"
cp "$BASE_DIR/bin/webmenu-utils" "$BIN_DIR/"

# Copie des fichiers de configuration
cp "$BASE_DIR/config/config.json" "$CONF_DIR/"
cp "$BASE_DIR/config/webmenu.json" "$CONF_DIR/"
cp "$BASE_DIR/config/templates/desktop.tpl" "$TEMPLATES_DIR/"

chmod +x "$BIN_DIR"/webmenu*

echo "Installation terminée."
echo "Assure-toi que ~/bin est dans ton PATH."

