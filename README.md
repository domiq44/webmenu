# WebMenu

WebMenu est un outil léger et personnalisable pour gérer des raccourcis vers des sites web sous Linux. Il permet de créer des entrées dans le menu des applications (.desktop) pour lancer des sites dans des navigateurs spécifiques, avec récupération automatique d'icônes et support pour tags et catégories. Idéal pour les environnements de bureau comme Cinnamon, GNOME ou KDE.

## Fonctionnalités

- **Gestion des entrées** : Ajouter, supprimer et lister des sites web via interface en ligne de commande (CLI) ou graphique (GUI).
- **Navigateurs supportés** : Firefox (normal ou SSB), Chromium, Chrome, Brave, Edge, et xdg-open.
- **Icônes automatiques** : Récupération des favicons depuis Google pour une intégration visuelle.
- **Synchronisation en temps réel** : Daemon qui surveille les changements et met à jour les fichiers .desktop automatiquement.
- **Personnalisation** : Templates modifiables pour les fichiers .desktop, configuration JSON flexible.
- **Tags et catégories** : Organisation des sites pour une meilleure gestion.

## Installation

### Prérequis

Assurez-vous que les dépendances suivantes sont installées sur votre système (exemples pour Fedora ; adaptez pour votre distribution) :

```bash
sudo dnf update
sudo dnf install jq zenity wget inotify-tools
```

- `jq` : Manipulation de fichiers JSON.
- `zenity` : Interface graphique pour les boîtes de dialogue.
- `wget` : Téléchargement des icônes.
- `inotify-tools` : Surveillance de fichiers pour le daemon.

Pour le rafraîchissement du menu d'applications :
- Cinnamon : `cinnamon` et `update-desktop-database`.
- GNOME/KDE : Peut nécessiter des ajustements (voir section Développement).

### Étapes d'installation

1. Clonez ou téléchargez le projet dans un dossier local (ex. : `/home/user/webmenu`).
2. Rendez-vous dans le dossier du projet :
   ```bash
   cd /chemin/vers/webmenu
   ```
3. Exécutez le script d'installation :
   ```bash
   ./install.sh
   ```
   Cela copie les fichiers vers :

   Le script `install.sh` effectue automatiquement les tâches suivantes :
   - Détecte le dossier source du projet.
   - Crée les répertoires nécessaires (`~/bin`, `~/.config/webmenu`, `~/.config/webmenu/templates`, `~/.config/webmenu/share/icons`).
   - Copie les scripts exécutables depuis `bin/` vers `~/bin`.
   - Copie les fichiers de configuration depuis `config/` vers `~/.config/webmenu`.
   - Rend les scripts dans `~/bin` exécutables (chmod +x).
   - Affiche un message de confirmation et un rappel pour ajouter `~/bin` au PATH.
   - Scripts : `~/bin/`
   - Configuration : `~/.config/webmenu/`
   - Icônes : `~/.config/webmenu/share/icons/`

   Le script `install.sh` effectue automatiquement les tâches suivantes :
   - Détecte le dossier source du projet.
   - Crée les répertoires nécessaires (`~/bin`, `~/.config/webmenu`, `~/.config/webmenu/templates`, `~/.config/webmenu/share/icons`).
   - Copie les scripts exécutables depuis `bin/` vers `~/bin`.
   - Copie les fichiers de configuration depuis `config/` vers `~/.config/webmenu`.
   - Rend les scripts dans `~/bin` exécutables (chmod +x).
   - Affiche un message de confirmation et un rappel pour ajouter `~/bin` au PATH.

4. Assurez-vous que `~/bin` est dans votre `PATH` :
   - Ajoutez `export PATH="$HOME/bin:$PATH"` à votre `~/.bashrc` ou `~/.zshrc`, puis rechargez :
     ```bash
     source ~/.bashrc
     ```

5. Vérifiez l'installation :
   ```bash
   webmenu --help  # Si supporté, sinon utilisez les commandes ci-dessous
   ```

## Utilisation

### Interface en Ligne de Commande (CLI)

Utilisez `webmenu` pour gérer vos sites via le terminal.

#### Ajouter un site
```bash
webmenu add "Nom du site" "https://example.com" --browser firefox --tags "tag1,tag2"
```
- Options :
  - `--browser` : Navigateur (défaut : firefox-ssb).
  - `--tags` : Tags séparés par des virgules.

#### Supprimer un site
```bash
webmenu remove "Nom du site"
```

#### Lister les sites
```bash
webmenu list
```

#### Synchroniser manuellement
```bash
webmenu sync
```
Régénère tous les fichiers .desktop.

#### Lancer l'interface graphique
```bash
webmenu gui
```

#### Démarrer le daemon
```bash
webmenu daemon
```
Surveille les changements dans `~/.config/webmenu/webmenu.json` et synchronise automatiquement.

#### Rafraîchir le menu
```bash
webmenu refresh
#### Rafraîchir les icônes
```bash
webmenu refresh-icons
```
Supprime toutes les icônes existantes et les retélécharge depuis les favicons des domaines.
```

### Interface Graphique (GUI)

Lancez `webmenu gui` pour une interface conviviale avec Zenity :
- **Ajouter** : Saisissez nom, URL, choisissez navigateur et icône.
- **Supprimer** : Sélectionnez un site dans la liste.
- **Lister** : Affiche une liste des sites.

### Exemples

1. Ajouter YouTube avec Firefox SSB :
   ```bash
   webmenu add "YouTube" "https://youtube.com" --browser firefox-ssb
   ```

2. Ajouter GitHub avec tags :
   ```bash
   webmenu add "GitHub" "https://github.com" --browser chromium --tags "dev,code"
   ```

3. Lister et vérifier :
   ```bash
   webmenu list
   ```

Les sites apparaissent dans le menu des applications sous la catégorie "Web".

## Configuration

Les fichiers de configuration se trouvent dans `~/.config/webmenu/` :

- **`config.json`** : Paramètres globaux.
  ```json
  {
    "default_browser": "firefox-ssb",
    "icon_refresh_days": 7,
    "template": "~/.config/webmenu/templates/desktop.tpl"
  }
  ```
  - `default_browser` : Navigateur par défaut.
  - `icon_refresh_days` : Jours avant rafraîchissement des icônes (actuellement non utilisé dans le code).
  - `template` : Chemin vers le template .desktop.

- **`webmenu.json`** : Base de données des sites.
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
  Modifiez directement ce fichier pour des changements en masse, puis exécutez `webmenu sync`.

- **`templates/desktop.tpl`** : Template pour les fichiers .desktop.
  Utilise des variables comme `{{NAME}}`, `{{EXEC}}`, `{{ICON}}`, `{{CATEGORY}}`.

## Développement et Maintenance

### Structure du Code

- **`bin/`** :
  - `webmenu` : CLI principal.
  - `webmenu-gui` : Interface graphique.
  - `webmenu-daemon` : Daemon de surveillance.
  - `webmenu-utils` : Fonctions utilitaires (chargement config, manipulation JSON, génération d'icônes).

- **`config/`** :
  - Fichiers de configuration et templates.

- **`share/icons/`** : Icônes téléchargées.

- **`install.sh`** : Script d'installation.

### Dépendances de Développement

En plus des prérequis utilisateur, installez :
- Bash (inclus dans la plupart des distributions).
- Éditeur de texte ou IDE (VS Code recommandé pour le débogage).

### Comment Contribuer

1. Forkez le dépôt (si hébergé sur GitHub/GitLab).
2. Créez une branche pour vos modifications :
   ```bash
   git checkout -b feature/nouvelle-fonction
   ```
3. Modifiez les scripts (respectez le style : fonctions modulaires, commentaires en français).
4. Testez :
   - Syntaxe Bash : `bash -n script.sh`
   - Fonctionnalités : Relancez `./install.sh` pour copier les modifications dans `~/bin`, puis testez les commandes.
5. Soumettez une pull request.

### Maintenance

- **Débogage** : Utilisez `set -x` dans les scripts pour tracer l'exécution.
- **Améliorations possibles** :
  - Support pour d'autres environnements de bureau (ajustez `refresh_cinnamon` dans `webmenu-utils`).
  - Validation JSON robuste avant écriture.
  - Cache d'icônes avec vérification de date.
  - Tests unitaires avec Bats (https://github.com/bats-core/bats).
- **Logs** : Le daemon affiche des messages dans le terminal ; redirigez vers un fichier pour le débogage.
- **Sécurité** : Vérifiez les téléchargements d'icônes ; échappez les variables pour éviter les injections.

### Problèmes Connus

- Le rafraîchissement est spécifique à Cinnamon ; pour GNOME, remplacez `cinnamon --replace` par `gnome-shell --replace`.
- Les icônes "auto" dépendent de Google favicons ; en cas d'échec, une icône par défaut est utilisée.
- Le daemon nécessite `inotify-tools` ; sinon, synchronisez manuellement.

## Licence

Ce projet est sous licence MIT (ou spécifiez si différente). Voir le fichier LICENSE si présent.

## Support

Pour des questions ou bugs :
- Ouvrez une issue sur le dépôt.
- Consultez les logs du daemon ou les erreurs dans le terminal.

---

*WebMenu v3 - Gérez vos sites web comme des applications natives.*
