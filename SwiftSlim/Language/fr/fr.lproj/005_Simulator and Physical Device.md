# Simulateur et appareil physique

Jusqu'à présent, nous avons déjà terminé la construction des vues de base. Le principal objectif de cette leçon est d'apprendre à exécuter une app sur le simulateur et sur un appareil physique (`Physical Device`).

Je me souviens encore de la première fois où j'ai installé une app sur mon iPhone : j'étais très heureux, parce que je pouvais voir plus directement le résultat de mon développement. C'est un retour positif. Quand nous pouvons utiliser une app que nous avons développée nous-mêmes, l'intérêt nous pousse naturellement à apprendre davantage.

Ouvrez maintenant le projet de CV personnel terminé dans la leçon précédente, et préparons-nous à l'exécuter sur simulateur et sur appareil physique.

## Simulateur

Xcode intègre de nombreux simulateurs couvrant différents modèles d'iPhone, d'iPad et d'Apple Watch. Le simulateur permet de vérifier les différences de mise en page d'une app sur différents modèles ou versions.

### Choisir un simulateur

Dans la liste des appareils située dans la barre d'outils supérieure de Xcode, sélectionnez un simulateur, par exemple `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Lancer le simulateur

Cliquez ensuite sur le bouton d'exécution en haut à gauche.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode construira automatiquement le projet et lancera le simulateur.

![Swift](../../RESOURCE/005_xcode2.png)

### Fermer le simulateur

Si vous avez besoin d'arrêter le simulateur, cliquez sur le bouton Stop dans la barre d'outils de Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

Vous pouvez aussi fermer directement le simulateur :

![Swift](../../RESOURCE/005_xcode17.png)

Si vous fermez directement le simulateur, Xcode peut afficher :

```
Thread 1: signal SIGTERM
```

En général, ce n'est pas une erreur de logique de programme, mais simplement parce que le processus de débogage a été interrompu de l'extérieur. On peut donc généralement l'ignorer.

Par rapport à l'aperçu Xcode, le simulateur est plus proche d'un environnement réel d'exécution, mais il ne correspond pas encore à un appareil complet. Il convient bien à la vérification de la mise en page et aux tests d'adaptation sur plusieurs modèles.

## Priorité des environnements de test

Dans un vrai flux de développement, il est recommandé de suivre cet ordre :

appareil physique > simulateur > aperçu Xcode

L'aperçu convient aux ajustements rapides de l'UI ; le simulateur convient aux tests structurels ; la validation finale doit impérativement être réalisée sur un appareil physique, en particulier pour tout ce qui concerne iCloud.

## Appareil physique

L'aperçu Xcode et le simulateur peuvent tous deux présenter des différences d'affichage. C'est pourquoi l'appareil physique est décisif. Les autorisations système, les performances, les mécanismes de notifications et d'autres comportements ne peuvent être pleinement validés que sur un appareil réel.

### Activer le mode développeur

Sur l'iPhone :

Réglages → Confidentialité et sécurité → Mode développeur → Activer

![Swift](../../RESOURCE/005_xcode4.png)

Le système redémarrera l'appareil de force. Si le mode développeur n'est pas activé, il sera impossible de lancer le débogage.

### Configurer l'équipe de développement

Xcode doit être configuré avec une équipe de développement ; sinon, il est impossible de signer l'application et de l'installer.

Chemin de configuration :

nom du projet → TARGETS → Signing & Capabilities → Team

Si `"Add Account..."` s'affiche, cela signifie qu'aucun compte Apple n'a encore été ajouté.

![Swift](../../RESOURCE/005_xcode5.png)

Cliquez sur le bouton d'ajout et connectez-vous avec votre Apple ID.

![Swift](../../RESOURCE/005_xcode6.png)

Après la connexion, choisissez le compte correspondant afin de terminer la configuration de l'équipe de développement.

![Swift](../../RESOURCE/005_xcode7.png)

### Connecter l'appareil

Utilisez un câble pour connecter l'iPhone au Mac.

Lors de la première connexion :

- le Mac demandera s'il faut connecter l'iPhone à ce Mac ;
- l'iPhone demandera s'il faut faire confiance à cet ordinateur.

Vous devez cliquer sur « Faire confiance » sur l'iPhone et saisir le code de déverrouillage. Ensuite, choisissez votre iPhone dans la liste des appareils Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Cliquez sur le bouton d'exécution en haut à gauche.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode construira alors l'application et l'installera sur l'iPhone.

![Swift](../../RESOURCE/005_view.png)

**Débogage sans fil**

À partir d'iOS 11, Xcode prend en charge le débogage sans fil.

![Swift](../../RESOURCE/005_xcode18.png)

Conditions préalables :

1. l'iPhone et le Mac doivent être appairés une première fois avec un câble de données
2. l'iPhone et le Mac doivent être sur le même réseau Wi-Fi
3. les deux appareils doivent rester déverrouillés

Une fois le premier appairage effectué par câble, il est ensuite possible d'exécuter directement l'app sans câble, tant que les deux appareils sont sur le même réseau.

Remarques :

- si l'appareil n'apparaît pas dans la liste, rebranchez le câble de données ;
- le débogage Wi-Fi est parfois instable ; si la connexion pose problème, rebranchez simplement le câble ;
- dans certains réseaux d'entreprise ou réseaux isolés, cette fonction peut être restreinte.

## Erreurs courantes et solutions

Lors du débogage avec Xcode connecté à un iPhone, différents messages d'erreur peuvent apparaître. Voici quelques problèmes fréquents et leur méthode de résolution, afin de vous aider à localiser rapidement la cause d'un problème de connexion.

**1. Appairage non terminé**

```
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Cela signifie que l'appairage de débogage entre Xcode et l'iPhone n'est pas encore terminé.

Solution : vérifiez que l'iPhone a bien été mis en confiance. Si l'erreur persiste, redémarrez Xcode puis reconnectez l'appareil.

**2. Équipe de développement non configurée**

```
Signing for "SwiftSlimTest" requires a development team.
```

Il est possible que l'équipe de développement ne soit pas configurée.

Solution : choisissez un compte connecté dans `Signing & Capabilities`.

**3. Impossible de monter le Developer Disk Image**

```
Previous preparation error: The developer disk image could not be mounted on this device.
```

Cela se produit souvent lorsque l'installation a été interrompue, par exemple à cause d'un câble débranché ou d'un arrêt forcé.

Solution : redémarrez l'iPhone puis reconnectez-le avec le câble.

**4. Échec de connexion du tunnel de débogage**

```
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Cette erreur est fréquente lorsqu'un VPN ou un proxy réseau interfère.

Solution : désactivez le VPN ou le proxy, puis réessayez.

**5. Appareil verrouillé**

```
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

L'appareil est verrouillé. Il suffit de déverrouiller l'iPhone.

**6. Appareil non enregistré**

```
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Cela signifie que l'appareil n'a pas encore été ajouté à la liste des appareils du compte développeur. Xcode ne peut donc pas générer un profil de provisioning valide pour signer et installer l'app.

Solution : cliquez sur `"Register Device"` pour l'enregistrer automatiquement.

**7. Incompatibilité de version de déploiement**

```
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Cela signifie que la version du système de l'appareil est inférieure à la version minimale de déploiement du projet.

Chemin de modification :

TARGETS → General → Deployment Info → Deployment Target

![Swift](../../RESOURCE/005_xcode15.png)

Ajustez la version pour qu'elle ne soit pas supérieure à celle du système de l'appareil.

Après modification, nettoyez le dossier de build :

Product → Clean Build Folder Immediately

![Swift](../../RESOURCE/005_xcode16.png)

Une fois le nettoyage terminé, relancez l'app.
