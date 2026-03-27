# Construir una página de currículum personal

En esta lección construiremos una vista sencilla de currículum personal y aprenderemos los siguientes conocimientos:

- `cornerRadius`
- `spacing`
- `ScrollView`

Durante el proceso repasaremos conceptos como diseño, `Text` e `Image`, y además implementaremos control de espaciado y efecto de desplazamiento del contenido.

## Currículum personal

Resultado objetivo:

![Swift](../../RESOURCE/004_img.png)

**Intenta completarlo primero por tu cuenta antes de seguir leyendo la explicación.**

### Crear el proyecto

Crea un nuevo proyecto de iOS o sigue usando el proyecto anterior.

Código predeterminado de `ContentView`:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}
```

Ahora borra ese contenido y empieza a escribir el tuyo:

```swift
struct ContentView: View {
    var body: some View {
        
    }
}
```

### Estructura general

En el desarrollo real, normalmente primero diseñamos la estructura general.

Nuestra página contiene:

1. Título
2. Información personal
3. Presentación personal

Añadimos un `VStack` en la capa más externa:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
    }
}
```

`VStack` garantiza que las vistas se ordenen verticalmente y además permite controlar su disposición y su espaciado.

### Título

Primero, creamos un `Text` para mostrar el título.

Aquí usaré mi nombre en inglés como título:

```swift
Text("FangJunyu")
```

![Swift](../../RESOURCE/004_img1.png)

El título normalmente se muestra con mayor tamaño y en negrita, así que aquí usamos los modificadores `font` y `fontWeight`:

```swift
Text("FangJunyu")
    .font(.largeTitle)
    .fontWeight(.bold)
```

![Swift](../../RESOURCE/004_img2.png)

### Maquetación

La alineación predeterminada en SwiftUI es `center`, así que ahora el título aparece en el centro de `ContentView`.

![Swift](../../RESOURCE/004_img3.png)

Necesitamos colocar el título en la parte superior de la vista. Podemos usar `Spacer` para ajustar el diseño:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

`Spacer` ocupará el espacio restante y empujará `Text` hacia la parte superior del contenedor.

![Swift](../../RESOURCE/004_img4.png)

### Espacio en blanco

Si te parece que el texto está demasiado cerca de la parte superior, puedes usar `padding` o `Spacer`.

**1. `padding`**

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top,20)
```

Esto establece el margen superior del `VStack` en `20`.

**2. `Spacer`**

```swift
VStack {
    Spacer().frame(height:20)
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Spacer()
}
.padding()
```

También se puede usar `Spacer` y fijar una altura con `frame` para obtener un espacio en blanco de altura determinada.

Resultado:

![Swift](../../RESOURCE/004_img5.png)

### Imagen

Preparamos una foto de retrato nuestra y la colocamos en la carpeta de recursos `Assets`.

![Swift](../../RESOURCE/004_img6.png)

En `ContentView`, usamos `Image` para mostrar la imagen:

```swift
VStack {
    Text("FangJunyu")
        .font(.largeTitle)
        .fontWeight(.bold)
    Image("image")
    Spacer()
}
.padding(.top, 20)
```

![Swift](../../RESOURCE/004_img7.png)

Como el tamaño original de la imagen es bastante grande, necesitamos usar `frame` para controlar el tamaño mostrado.

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 200)
```

En este momento veremos un problema:

Si la proporción entre ancho y alto del `frame` no coincide con la proporción original de la imagen, la imagen se deformará.

Por ejemplo:

```swift
Image("image")
    .resizable()
    .frame(width: 160, height: 100)
```

![Swift](../../RESOURCE/004_img8.png)

Para evitar que la imagen se deforme, necesitamos usar `scaledToFit`:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140, height: 200)
```

La función de `scaledToFit` es:

Dentro del rango dado por `frame`, escalar la imagen según su proporción original y mostrarla completa.

No estira la imagen a la fuerza para llenar todo el `frame`, sino que mantiene su proporción y la escala uniformemente hasta que uno de sus lados se ajusta justo al borde.

Eso significa que:

- Si el ancho del `frame` es menor, la imagen se escalará tomando el ancho como referencia.
- Si la altura del `frame` es menor, la imagen se escalará tomando la altura como referencia.
- La imagen siempre mantiene su proporción original y no se deforma.

Normalmente basta con fijar una sola dimensión. Por ejemplo:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
```

![Swift](../../RESOURCE/004_img7.png)

Así el sistema calculará automáticamente una altura adecuada a partir del ancho `140`, manteniendo al mismo tiempo la proporción de la imagen.

Si necesitas una proporción visual fija o evitar que la vista se comprima dentro de diseños más complejos, también puedes limitar ancho y alto a la vez.

### Esquinas redondeadas

Si quieres que la imagen se muestre con esquinas redondeadas, puedes usar el modificador `cornerRadius`:

```swift
.cornerRadius(10)
```

Por ejemplo:

```swift
Image("image")
    .resizable()
    .scaledToFit()
    .frame(width: 140)
    .cornerRadius(20)
```

Añadimos `cornerRadius(20)` después de los modificadores de `Image`.

![Swift](../../RESOURCE/004_img9.png)

`cornerRadius(20)` significa que el borde de la vista se recorta y se aplica un radio de esquina redondeada de `20`.

Después de añadir las esquinas redondeadas, las cuatro esquinas de la imagen se convierten en arcos, lo que da una apariencia más suave y moderna.

Este estilo de diseño es muy común en las interfaces actuales. Por ejemplo, los iconos de apps en iOS también usan una forma de rectángulo redondeado, aunque los iconos del sistema emplean una superelipse de curvatura continua y no simples esquinas redondeadas.

### Información personal

Ahora empezamos a construir el área de información personal a la izquierda de la imagen. Viendo la estructura de la interfaz, la información personal y la imagen están colocadas horizontalmente, así que necesitamos usar `HStack`.

![Swift](../../RESOURCE/004_img10.png)

```swift
HStack {
    // Text
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

El contenido de la información personal está dispuesto verticalmente.

![Swift](../../RESOURCE/004_img11.png)

Por eso, usamos `HStack` en la capa exterior, `VStack` para la información personal, y `Text` para el contenido textual.

Estructura básica:

```swift
HStack {
    VStack {
        Text("Name")
        Text("Fang Junyu")
        Text("Age")
        Text("28")
        Text("Country")
        Text("China")
    }
    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

![Swift](../../RESOURCE/004_img12.png)

**Poner en negrita los títulos de los campos**

Para distinguir entre el nombre del campo y su valor, podemos aplicar `fontWeight` al nombre del campo:

```swift
Text("Name")
    .fontWeight(.bold)
Text("Fang Junyu")
```

![Swift](../../RESOURCE/004_img13.png)

**Alinear el texto a la izquierda**

`VStack` está centrado por defecto. Si queremos que todo el texto se alinee a la izquierda, necesitamos configurar la alineación:

```swift
VStack(alignment: .leading) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    ...
}
```

`.leading` significa alineación al lado izquierdo en entornos de idioma de izquierda a derecha.

![Swift](../../RESOURCE/004_img14.png)

### Espaciado

Si queremos mantener una distancia fija entre la información personal y la imagen, anteriormente aprendimos a usar `Spacer` para crear ese espacio:

```swift
Spacer()
    .frame(width: 10)
```

También podemos usar el parámetro `spacing` de `HStack`:

```swift
HStack(spacing: 30) {
    VStack(alignment: .leading) {
        ...
    }

    Image("image")
        .resizable()
        .scaledToFit()
        .frame(width: 140)
        .cornerRadius(20)
}
```

`spacing: 30` significa que la distancia entre las dos subviews es de `30 pt`.

![Swift](../../RESOURCE/004_img15.png)

**¿Qué es `spacing`?**

En `VStack`, `HStack` y `ZStack`, `spacing` puede controlar la distancia entre las subviews.

Por ejemplo:

```swift
VStack(spacing: 10) {
    VStack {}
    VStack {}
    VStack {}
}
```

La distancia entre las subviews del `VStack` se establecerá en `10 pt`.

![Swift](../../RESOURCE/004_img16.png)

Hay que tener en cuenta que `spacing` solo afecta a las “subviews directas”, y no modifica el diseño interno de los contenedores anidados.

**Controlar el espaciado dentro de la lista**

Si queremos aumentar la distancia entre los campos, la forma más directa es establecer `spacing` en el `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Name")
        .fontWeight(.bold)
    Text("Fang Junyu")
    Text("Age")
        .fontWeight(.bold)
    Text("28")
    Text("Country")
        .fontWeight(.bold)
    Text("China")
}
```

![Swift](../../RESOURCE/004_img17.png)

Así, la distancia entre todas las subviews se convertirá en `10 pt`.

Pero si observas la interfaz, aparece un problema:

Hay espacio entre grupos de campos, pero también la misma distancia entre el nombre del campo y su valor.

Esto se debe a que `spacing` actúa sobre todas las subviews directas del contenedor actual.

En esta estructura, cada `Text` es una subview directa del `VStack` exterior, por lo que el espaciado es uniforme.

Si queremos que haya espacio entre grupos de campos, pero que el nombre y el valor del campo mantengan la distancia compacta predeterminada, podemos considerar “nombre del campo + valor del campo” como una unidad lógica y envolverlos con un `VStack`:

```swift
VStack(alignment: .leading, spacing: 10) {
    VStack(alignment: .leading) {
        Text("Name")
            .fontWeight(.bold)
        Text("Fang Junyu")
    }
    VStack(alignment: .leading) {
        Text("Age")
            .fontWeight(.bold)
        Text("28")
    }
    VStack(alignment: .leading) {
        Text("Country")
            .fontWeight(.bold)
        Text("China")
    }
}
```

En ese caso, la estructura pasa a ser: espaciado entre los `VStack` exteriores, y distancia compacta predeterminada dentro de cada `VStack` interior. Así, no aparecerá un hueco extra entre el nombre y el valor del campo.

![Swift](../../RESOURCE/004_img18.png)

### Presentación personal

A continuación, construiremos el área de presentación personal.

Desde la estructura de la interfaz se puede ver que el contenido de presentación está formado por varias líneas de texto, dispuestas verticalmente.

![Swift](../../RESOURCE/004_img19.png)

Por lo tanto, podemos usar `VStack` junto con `Text`:

```swift
VStack {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn new things.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
}
```

**Aumentar el espaciado**

Ahora la información personal y la presentación personal están demasiado juntas, y el estilo todavía no se ve muy bien.

![Swift](../../RESOURCE/004_img20.png)

Como ambas están dentro del mismo contenedor exterior, podemos controlar el espaciado general desde ese contenedor:

```swift
VStack(spacing: 30) {
    ...
    HStack(spacing: 30) {
        ...
    }
    VStack {
        Text("I am an iOS developer.")
        Text("I build apps with Swift.")
        ...
    }
}
.padding()
```

Resultado:

![Swift](../../RESOURCE/004_img21.png)

**Espaciado de la lista**

Usa `spacing` para controlar la distancia entre los textos de la presentación personal:

```swift
VStack(spacing:10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img22.png)

### Completar el currículum personal

Ahora la estructura básica de nuestro currículum personal ya está terminada.

![Swift](../../RESOURCE/004_img.png)

### Vista desplazable

Ahora la estructura de la página usa `VStack`. Cuando hay pocas líneas de texto en la presentación no hay problema, pero si aumentamos el contenido a `20`, `30` o más líneas, la altura total excederá la pantalla.

Por ejemplo:

```swift
VStack(alignment:.leading, spacing: 10) {
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    Text("I like to learn newthings.")
    Text("I am a good person.")
    Text("I am a good developer.")
    Text("I work hard every day.")
    Text("I am an iOS developer.")
    Text("I build apps with Swift.")
    ...
}
```

![Swift](../../RESOURCE/004_img23.png)

En ese momento aparecerán dos fenómenos:

- El contenido inferior queda recortado
- La página no puede desplazarse

Esto no es un problema de `VStack`. `VStack` es solo un contenedor de diseño, y no proporciona desplazamiento automáticamente.

**Qué es `ScrollView`**

`ScrollView` es un contenedor desplazable, adecuado para contenido abundante que supera el tamaño de la pantalla, por ejemplo listas verticales u horizontales.

Estructura básica:

```swift
ScrollView {
    ...
}
```

Si queremos implementar desplazamiento, necesitamos envolver el contenido completo de la página dentro de `ScrollView`:

```swift
struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ...
            }
            .padding()
        }
    }
}
```

![Swift](../../RESOURCE/004_img24.png)

De este modo, toda la página se convierte en un área desplazable. Cuando el contenido supera la altura de la pantalla, se podrá desplazar de forma natural.

`ScrollView` muestra por defecto un indicador de desplazamiento. Si quieres ocultarlo, puedes configurar:

```swift
ScrollView(showsIndicators: false) {
    ...
}
```

## Código completo

```swift
struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("FangJunyu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.bold)
                            Text("Fang Junyu")
                        }
                        VStack(alignment: .leading) {
                            Text("Age")
                                .fontWeight(.bold)
                            Text("28")
                        }
                        VStack(alignment: .leading) {
                            Text("Country")
                                .fontWeight(.bold)
                            Text("China")
                        }
                    }
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height:200)
                        .cornerRadius(20)
                }
                VStack(spacing:10) {
                    Text("I am an iOS developer.")
                    Text("I build apps with Swift.")
                    Text("I like to learn new things.")
                    Text("I am a good person.")
                    Text("I am a good developer.")
                    Text("I work hard every day.")
                }
                Spacer()
            }
            .padding()
        }
    }
}
```
