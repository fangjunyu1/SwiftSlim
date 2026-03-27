# Simulador y dispositivo físico

Hasta este punto ya hemos completado la construcción de vistas básicas. El objetivo principal de esta lección es aprender a ejecutar la app en el simulador y en un dispositivo físico (`Physical Device`).

Todavía recuerdo la primera vez que instalé una app en mi iPhone: me sentí muy feliz, porque podía ver de manera mucho más directa el resultado de mi desarrollo. Ese tipo de experiencia es una retroalimentación positiva. Cuando podemos usar una app desarrollada por nosotros mismos, el interés nos empuja de forma natural a aprender más.

Ahora, abre el proyecto del currículum personal que completaste en la lección anterior y prepárate para ejecutar la app en el simulador y en un dispositivo físico.

## Simulador

Xcode incluye varios simuladores integrados, que cubren distintos modelos de iPhone, iPad y Apple Watch. El simulador permite comprobar diferencias de diseño y distribución de la interfaz entre distintos modelos o versiones.

### Elegir un simulador

En la lista de dispositivos de la barra superior de herramientas de Xcode, elige un simulador, por ejemplo `iPhone 16`.

![Swift](../../RESOURCE/005_xcode.png)

### Ejecutar el simulador

Después, haz clic en el botón de ejecutar situado en la esquina superior izquierda.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode construirá automáticamente el proyecto y abrirá el simulador.

![Swift](../../RESOURCE/005_xcode2.png)

### Cerrar el simulador

Si necesitas cerrar el simulador, haz clic en el botón de detener de la barra de herramientas de Xcode.

![Swift](../../RESOURCE/005_xcode3.png)

También puedes cerrar directamente el simulador:

![Swift](../../RESOURCE/005_xcode17.png)

Si cierras directamente el simulador, Xcode puede mostrar el siguiente mensaje:

```text
Thread 1: signal SIGTERM
```

Normalmente esto no es un error de la lógica del programa, sino que el proceso de depuración fue terminado desde fuera. En general se puede ignorar y no pertenece a un error de la lógica de la app.

En comparación con la vista previa de Xcode, el simulador se parece más al entorno real de ejecución. Aun así, sigue sin ser un entorno de dispositivo completamente real. Es adecuado para verificar diseños y realizar pruebas de adaptación a distintos modelos.

## Sobre la prioridad de los entornos de prueba

En un flujo real de desarrollo, conviene seguir este orden de prueba:

Dispositivo físico > Simulador > Vista previa de Xcode

La vista previa es adecuada para ajustes rápidos de UI; el simulador sirve para pruebas estructurales; y la validación final debe hacerse en un dispositivo físico, especialmente en operaciones relacionadas con iCloud.

## Dispositivo físico

Tanto la vista previa de Xcode como el simulador pueden mostrar resultados inexactos, por lo que el dispositivo físico tiene un valor decisivo. Comportamientos como permisos del sistema, rendimiento o notificaciones solo pueden verificarse completamente en un dispositivo físico.

### Activar el modo desarrollador

En el iPhone:

Configuración → Privacidad y seguridad → Modo desarrollador → Activar

![Swift](../../RESOURCE/005_xcode4.png)

El sistema forzará un reinicio del dispositivo. Si el modo desarrollador no está activado, no será posible depurar ni ejecutar la app.

### Configurar el equipo de desarrollador

Xcode debe tener configurado un equipo de desarrollador; de lo contrario, no podrá firmar ni instalar la aplicación.

Ruta de configuración:

Nombre del proyecto → `TARGETS` → `Signing & Capabilities` → `Team`

Si aparece `Add Account...`, significa que todavía no se ha añadido ninguna cuenta de Apple.

![Swift](../../RESOURCE/005_xcode5.png)

Haz clic en el botón de añadir e inicia sesión con tu `Apple ID`.

![Swift](../../RESOURCE/005_xcode6.png)

Después de iniciar sesión, selecciona la cuenta correspondiente para completar la configuración del equipo de desarrollador.

![Swift](../../RESOURCE/005_xcode7.png)

### Conectar el dispositivo

Conecta el iPhone y el Mac con un cable.

La primera vez que los conectes:

- El Mac preguntará si quieres conectar el iPhone a este Mac
- El iPhone preguntará si confías en este ordenador

Debes tocar “Confiar” en el iPhone e introducir el código de desbloqueo. Después de eso, selecciona tu iPhone en la lista de dispositivos de Xcode.

![Swift](../../RESOURCE/005_xcode9.png)

Haz clic en el botón de ejecutar de la esquina superior izquierda.

![Swift](../../RESOURCE/005_xcode1.png)

Xcode construirá la app y la instalará en el iPhone.

![Swift](../../RESOURCE/005_view.png)

**Depuración inalámbrica**

Desde iOS 11 en adelante, Xcode admite depuración inalámbrica.

![Swift](../../RESOURCE/005_xcode18.png)

Condiciones previas:

1. La primera vez, el iPhone y el Mac deben emparejarse mediante cable
2. El iPhone y el Mac deben estar en la misma red Wi‑Fi
3. Ambos dispositivos deben permanecer desbloqueados

Después de completar el emparejamiento por cable una primera vez, aunque retires el cable, podrás seguir ejecutando la app directamente mientras ambos estén en la misma red.

Aspectos a tener en cuenta:

- Si el dispositivo no aparece en la lista, vuelve a conectar el cable
- La depuración por Wi‑Fi a veces no es estable; si la conexión falla, volver a conectar el cable suele resolverlo
- En redes corporativas o redes aisladas puede haber restricciones

## Errores comunes y soluciones

Al conectar el iPhone a Xcode para depuración, pueden aparecer distintos tipos de mensajes de error. A continuación se enumeran algunos problemas frecuentes y sus soluciones correspondientes, para ayudarte a localizar y resolver rápidamente anomalías de conexión.

**1. El emparejamiento no se ha completado**

```text
Respond to the trust dialog on the device if present, and wait until pairing has completed.
```

![Swift](../../RESOURCE/005_xcode10.png)

Esto indica que el emparejamiento de depuración entre Xcode y el iPhone aún no se ha completado.

Solución: confirma que en el iPhone ya se tocó “Confiar”. Si el error continúa, reinicia Xcode y vuelve a conectar el dispositivo.

**2. No hay equipo de desarrollador configurado**

```text
Signing for "SwiftSlimTest" requires a development team.
```

Puede que no hayas configurado un equipo de desarrollador.

Solución: en `Signing & Capabilities`, selecciona la cuenta con la que has iniciado sesión.

**3. No se puede montar la Developer Disk Image**

```text
Previous preparation error: The developer disk image could not be mounted on this device.
```

Esto suele ocurrir cuando el proceso de instalación se interrumpe, por ejemplo al desconectar el cable o detenerlo a la fuerza, y después aparecen restricciones al reinstalar.

Solución: reinicia el iPhone y vuelve a conectarlo por cable.

**4. Falló la conexión del túnel de depuración**

```text
The tunnel connection failed while the system tried to connect to the device.
```

![Swift](../../RESOURCE/005_xcode11.png)

Este error suele aparecer cuando una VPN o un proxy de red interfiere en la conexión.

Solución: desactiva la VPN o el proxy de red y vuelve a intentarlo.

**5. El dispositivo está bloqueado**

```text
Development services need to be enabled. Ensure that the device is unlocked.
```

![Swift](../../RESOURCE/005_xcode12.png)

El dispositivo está en la pantalla de bloqueo. Basta con desbloquear el iPhone.

**6. El dispositivo no está registrado**

```text
Device "iPhone" isn't registered in your developer account.
```

![Swift](../../RESOURCE/005_xcode13.png)

Esto significa que el dispositivo no está añadido a la lista de dispositivos de tu cuenta de desarrollador, por lo que Xcode no puede generar un perfil válido para firmar e instalar la app.

Solución: haz clic en `Register Device` para registrarlo automáticamente.

**7. La versión de despliegue no coincide**

```text
iOS 17.6.1 doesn’t match StoreKit2.app’s iOS 18.0 deployment target
```

![Swift](../../RESOURCE/005_xcode14.png)

Esto significa que la versión del sistema del dispositivo es inferior a la versión mínima de despliegue del proyecto.

Ruta para modificarlo:

`TARGETS` → `General` → `Deployment Info` → `Deployment Target`

![Swift](../../RESOURCE/005_xcode15.png)

Ajusta la versión para que no sea superior a la versión del sistema del dispositivo.

Después de modificarla, limpia la carpeta de compilación:

`Product` → `Clean Build Folder Immediately`

![Swift](../../RESOURCE/005_xcode16.png)

Después de limpiar, vuelve a ejecutar.
