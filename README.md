# 🌐 WebMenu  
**Gérez vos sites web comme des applications natives sous Linux**

WebMenu est un outil léger, rapide et personnalisable permettant de créer des raccourcis vers des sites web directement dans le menu des applications Linux.  
Chaque site devient une “web‑app” avec son icône, son navigateur dédié, ses tags et sa catégorie.

Compatible avec Cinnamon, GNOME, KDE et la plupart des environnements de bureau.

---

# ✨ Fonctionnalités

- **CLI complète** : ajouter, supprimer, lister, synchroniser.
- **Interface graphique (Zenity)** simple et efficace.
- **Navigateurs supportés** : Firefox, Firefox SSB, Chromium, Chrome, Brave, Edge, xdg-open.
- **Icônes automatiques** : récupération intelligente via plusieurs sources (Google, favicon.ico, favicon.im).
- **Daemon de synchronisation** : mise à jour automatique des fichiers `.desktop`.
- **Templates personnalisables** : modifiez le rendu des entrées.
- **Tags et catégories** pour organiser vos webapps.
- **Configuration JSON** claire et modifiable.

---

# 📦 Installation

## Prérequis

Installez les dépendances nécessaires (exemple pour Fedora) :

```bash
sudo dnf install jq zenity wget inotify-tools file
```

- **jq** : manipulation JSON  
- **zenity** : interface graphique  
- **wget** : téléchargement des icônes  
- **inotify-tools** : surveillance de fichiers  
- **file** : vérification des types MIME  

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

3. Assurez-vous que `~/.local/bin` est dans votre `PATH` :
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

Options :

- `--browser` : navigateur utilisé  
- `--tags` : tags séparés par des virgules  

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
- `{{CATEGORY}}`

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
- Support Flatpak/Snap pour les navigateurs.
- Mode “édition” dans la GUI.

---

# 🐞 Support

Pour signaler un bug ou proposer une amélioration :  
👉 Ouvrez une issue sur le dépôt GitHub.

---

# 📄 Licence

Projet sous licence **MIT**.

---

# 🎉 WebMenu — Transformez vos sites web en applications natives

