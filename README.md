# 🌐 WebMenu  
**Transformez vos sites web en applications natives sous Linux**

WebMenu est un outil léger, rapide et personnalisable permettant de créer des web‑apps directement intégrées dans le menu des applications Linux.  
Chaque site devient une application avec son icône, son navigateur dédié, ses tags et son propre lanceur.

Compatible avec **Cinnamon**, **GNOME**, **KDE** et la plupart des environnements Freedesktop.

---

# ✨ Fonctionnalités

- **CLI complète** : ajouter, supprimer, lister, synchroniser, rafraîchir.
- **Interface graphique (Zenity)** simple et intuitive.
- **Menu dédié “Web”** automatiquement créé dans le menu des applications.
- **Navigateurs supportés** : Firefox, Firefox SSB, Chromium, Chrome, Brave, Edge, xdg-open.
- **Icônes automatiques** : récupération intelligente via Google, favicon.ico, favicon.im.
- **Daemon de synchronisation** : mise à jour automatique des fichiers `.desktop`.
- **Templates personnalisables** pour contrôler le rendu final.
- **Tags et métadonnées** pour organiser vos webapps.
- **Configuration JSON** simple et modifiable.
- **Commande `purge`** pour désinstaller proprement WebMenu.

---

# 📦 Installation

## Prérequis

Installez les dépendances nécessaires (exemple Fedora) :

```bash
sudo dnf install jq zenity wget inotify-tools file
```

- `jq` : manipulation JSON  
- `zenity` : interface graphique  
- `wget` : téléchargement des icônes  
- `inotify-tools` : surveillance du fichier JSON  
- `file` : détection du type MIME  

## Installation

1. Clonez le projet :

```bash
git clone https://github.com/domiq44/webmenu
cd webmenu
```

2. Lancez l’installation :

```bash
./install.sh
```

Le script installe automatiquement :

- les exécutables dans `~/.local/bin/`
- la configuration dans `~/.config/webmenu/`
- les templates dans `~/.config/webmenu/templates/`
- les icônes dans `~/.config/webmenu/share/icons/`

3. Assurez-vous que `~/.local/bin` est dans votre PATH :

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

4. Vérifiez l’installation :

```bash
webmenu list
```

---

# 🖥️ Utilisation

## Ajouter un site

```bash
webmenu add "YouTube" "https://youtube.com" --browser firefox --tags "video,media"
```

## Supprimer un site

```bash
webmenu remove "YouTube"
```

## Lister les sites

```bash
webmenu list
```

## Synchroniser manuellement

```bash
webmenu sync
```

## Rafraîchir les icônes

```bash
webmenu refresh-icons
```

## Interface graphique

```bash
webmenu gui
```

## Démarrer le daemon

```bash
webmenu daemon
```

## Désinstaller proprement WebMenu

```bash
webmenu purge
```

---

# ⚙️ Configuration

Les fichiers se trouvent dans `~/.config/webmenu/`.

## `config.json`

```json
{
  "default_browser": "firefox",
  "icon_refresh_days": 7,
  "template": "~/.config/webmenu/templates/desktop.tpl"
}
```

## `webmenu.json`

Base de données des sites :

```json
{
  "entries": [
    {
      "name": "Exemple",
      "url": "https://example.com",
      "browser": "firefox",
      "icon": "auto",
      "category": "Web",
      "tags": ["tag1"]
    }
  ]
}
```

## Template `.desktop`

Fichier : `templates/desktop.tpl`

Variables disponibles :

- `{{NAME}}`
- `{{EXEC}}`
- `{{ICON}}`
- `{{CATEGORY}}` *(remplacé automatiquement par `WebMenu`)*

---

# 🧩 Structure du projet

```
webmenu/
├── bin/
│   ├── webmenu
│   ├── webmenu-gui
│   ├── webmenu-daemon
│   └── webmenu-utils
├── config/
│   ├── config.json
│   ├── webmenu.json
│   └── templates/
│       └── desktop.tpl
├── install.sh
└── README.md
```

---

# 🛠️ Développement

## Tester les scripts

```bash
bash -n bin/webmenu
bash -n bin/webmenu-utils
```

## Idées d’amélioration

- Support GNOME/KDE natif pour le rafraîchissement du menu.
- Cache d’icônes avec expiration.
- Tests automatisés (Bats).
- Mode édition dans la GUI.
- Support des sous‑menus (Web / Social / Dev / Media).

---

# 🐞 Support

Pour signaler un bug ou proposer une amélioration :  
👉 Ouvrez une issue sur le dépôt GitHub.

---

# 📄 Licence

Projet sous licence **MIT**.

---

# 🎉 WebMenu — Transformez vos sites web en applications natives

