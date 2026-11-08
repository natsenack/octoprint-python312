# OctoPrint sur Python 3.12 (sans plugins supplémentaires)

Image Docker construite avec **Python 3.12** et **OctoPrint 1.11.8**.

Elle ne contient **aucun plugin tiers préinstallé**, aucun compte, aucune clé API, aucun profil d'imprimante et aucun fichier G-code. Les plugins inclus dans OctoPrint lui-même restent présents.

## Démarrer une instance neuve

```bash
docker compose up -d --build
```

Ouvrir `http://ADRESSE_DU_SERVEUR:5000` puis suivre l'assistant de configuration.

Le volume nommé `octoprint_data` contient les données persistantes. **Ne connectez pas cette image au volume d'une installation existante sans sauvegarde préalable.**

## Exporter l'image Docker

```bash
docker save octoprint-python312:1.0.0 | gzip > octoprint-python312-1.0.0.tar.gz
```

## Importer sur un autre ordinateur

```bash
docker load -i octoprint-python312-1.0.0.tar.gz
```

## Imprimante USB

Pour une imprimante reliée en USB, adapter la section `devices` du fichier `compose.yaml` au chemin du périphérique sur l'hôte. Éviter le mode `privileged` si possible.

## Notes

- Cette image utilise `--iknowwhatimdoing` car le processus tourne en root dans le conteneur. C'est le comportement de l'image de test validée, **pas une configuration durcie de production**.
- L'absence de plugins supplémentaires a été vérifiée par construction (aucune commande d'installation de plugins tiers). Un **démarrage sur volume vierge** reste à valider avant publication comme version stable.
- Le Dockerfile utilise `python:3.12-slim-bookworm` et fixe la version d'OctoPrint. Le correctif Python exact peut évoluer lors d'une reconstruction future.
- Le dépôt GitHub doit contenir les fichiers sources. Pour distribuer l'image préconstruite, utiliser GitHub Container Registry (GHCR).
