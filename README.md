# Agora Flutter Quickstart

 
Un projet d'application d'appel vidéo simple "VideoConnect". Une application Flutter avec une interface utilisateur matérielle simple. Cette application permet de connecter des vidéos de groupe jusqu'à 4 appareils à la fois en utilisant Agora.

Ce tutoriel décrit comment créer un compte Agora et construire un exemple d'application avec Agora en utilisant [Flutter](https://flutter.io/).

## Prérequis

- Agora.io [Compte de développeur](https://dashboard.agora.io/signin/)
- Flutter](https://flutter.io/) 1.0.0

## Démarrage rapide

Ce dépôt vous montre comment utiliser Agora Flutter SDK pour construire une application simple d'appel vidéo. Il vous montre comment :

- Rejoindre / quitter un canal
- Couper / rétablir le son
- Changer de vue de la caméra
- Disposer de plusieurs vues vidéo

 

![Screenshot-1](screenshot-1.png)
![Screenshot-2](screenshot-2.png)

### Créer un compte et obtenir un App ID

Pour construire et exécuter l'application d'exemple, obtenez d'abord un App ID :

1. Créez un compte de développeur sur [agora.io](https://dashboard.agora.io/signin/). Une fois que vous avez terminé le processus d'inscription, vous êtes redirigé vers le tableau de bord.
2. Naviguez dans l'arborescence du tableau de bord sur la gauche vers **Projets** > **Liste de projets**.
3. Copiez l'identifiant de l'application que vous obtenez du tableau de bord dans un fichier texte. Vous l'utiliserez lorsque vous lancerez l'application.

 

### Mise à jour et exécution de l'application type

Ouvrez le fichier [settings.dart](lib/src/utils/settings.dart) et ajoutez l'identifiant de l'application.

```dart
  const APP_ID = "";
```

Exécutez la commande `packages get` dans le répertoire de votre projet :

```bash
  # install dependencies
  flutter packages get
```

Une fois la construction terminée, exécutez la commande `run` pour lancer l'application.

```bash
  # start app
  flutter run
```

#### Nous vous recommandons d'utiliser un IDE pour contrôler l'ensemble du processus de construction pendant le développement.

Pour plus de détails sur la configuration de l'IDE, veuillez consulter le site suivant [here](https://flutter.io/docs/get-started/editor?tab=vscode)

## Gestion des erreurs

### Fuite de mémoire dans iOS

si votre canal de flutter est stable, `PlatformView` entraînera une fuite de mémoire, vous pouvez exécuter `flutter channel beta`

[vous pouvez vous référer à cette demande de retrait](https://github.com/flutter/engine/pull/14326)

### Android Black screen

`Tips: Vérifiez que toutes les configurations sont correctes, mais l'écran reste noir.`

si votre activité principale s'étend `io.flutter.embedding.android.FlutterActivity` et remplacer le `configureFlutterEngine` function

n'oubliez pas d'ajouter `super.configureFlutterEngine(flutterEngine)`

n'ajoutez pas `GeneratedPluginRegistrant.registerWith(flutterEngine)`, les plugins seront enregistrés automatiquement maintenant

[vous pouvez vous référer aux documents officiels](https://flutter.dev/docs/development/packages-and-plugins/plugin-api-migration)

### Android Release crash

cela provoque une obfuscation du code à cause de Flutter qui règle `android.enableR8=true` par défaut.

Ajoutez la ligne suivante dans le fichier **app/proguard-rules.pro** pour empêcher l'obfuscation du code :

```proguard
-keep class io.agora.**{*;}
```

## Reporting an issue

Veuillez vous assurer de fournir les informations suivantes lorsque vous signalez un problème,

### Environment

#### Flutter Doctor

exécutez  `flutter doctor` et copier la sortie du journal.

#### Agora SDK Logs

Insérez le code ci-dessous

```dart
AgoraRtcEngine.setParameters("{\"rtc.log_filter\": 65535}");
```

à l'adresse `call.dart`
Le résultat final ressemblerait à ceci,

```dart
...
    _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    AgoraRtcEngine.enableWebSdkInteroperability(true);
    AgoraRtcEngine.setParameters('{\"che.video.lowBitRateStreamParameter\":{\"width\":320,\"height\":180,\"frameRate\":15,\"bitRate\":140}}');
    AgoraRtcEngine.setParameters("{\"rtc.log_filter\": 65535}");
    AgoraRtcEngine.joinChannel(null, widget.channelName, null, 0);
...
```

puis lancez l'application. Le journal de notre sdk s'imprimera directement dans la console dans ce cas.

## Resources

- Complete [API documentation](https://docs.agora.io/en/) au Centre des développeurs
- [Fichiers de bugs concernant cet échantillon](https://github.com/AgoraIO-Community/Agora-Flutter-Quickstart/issues)
- [Flutter lab: Écrivez votre première application Flutter](https://flutter.io/docs/get-started/codelab)
- [Flutter cookbook: Exemples utiles de Flutter](https://flutter.io/docs/cookbook)
- [Documentation en ligne de Flutter](https://flutter.io/docs), qui propose des didacticiels, des échantillons, des conseils sur le développement mobile et une référence API complète.

## Credit

https://pub.dartlang.org/packages/permission_handler

## License

Ce logiciel est sous la licence MIT (MIT).
