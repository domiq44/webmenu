#!/usr/bin/env bash
set -euo pipefail

###############################################
#              DÉTECTION DES CHEMINS          #
###############################################

# Dossier du projet (là où se trouve install.sh)
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Dossiers d'installation
BIN_DIR="$HOME/.local/bin"
CONF_DIR="$HOME/.config/webmenu"
TEMPLATES_DIR="$CONF_DIR/templates"
SHARE_DIR="$CONF_DIR/share/icons"

###############################################
#              AFFICHAGE INFO                 #
###############################################

echo "Installation de WebMenu..."
echo "Dossier source : $BASE_DIR"

###############################################
#              CRÉATION DES DOSSIERS          #
###############################################

mkdir -p "$BIN_DIR"
mkdir -p "$CONF_DIR"
mkdir -p "$TEMPLATES_DIR"
mkdir -p "$SHARE_DIR"

###############################################
#              COPIE DES SCRIPTS              #
###############################################

cp "$BASE_DIR/bin/webmenu"         "$BIN_DIR/"
cp "$BASE_DIR/bin/webmenu-gui"     "$BIN_DIR/"
cp "$BASE_DIR/bin/webmenu-daemon"  "$BIN_DIR/"
cp "$BASE_DIR/bin/webmenu-utils"   "$BIN_DIR/"

###############################################
#         COPIE DES FICHIERS DE CONFIG        #
###############################################

cp "$BASE_DIR/config/config.json"              "$CONF_DIR/"
cp "$BASE_DIR/config/webmenu.json"             "$CONF_DIR/"
cp "$BASE_DIR/config/templates/desktop.tpl"    "$TEMPLATES_DIR/"

###############################################
#              DROITS D'EXÉCUTION             #
###############################################

chmod +x "$BIN_DIR"/webmenu*
chmod +x "$BIN_DIR"/webmenu-utils

###############################################
#                 FIN D'INSTALL               #
###############################################

echo "Installation terminée."
echo "Assure-toi que ~/.local/bin est dans ton PATH."

