# Ақша жинайтын құты

Бұл сабақта біз қарапайым “ақша жинайтын құты” жобасын жасаймыз. Оның функциясы қарапайым, бірақ ішінде толық интерактив логика бар, сондықтан жаңадан бастаушыларға өте қолайлы.

Осы жоба арқылы біз `TextField` (енгізу өрісі), `border` жақтауын және дерек байланысын (`$`) үйренеміз.

Соңғы мақсат — пайдаланушы соманы енгізіп, батырманы басқанда оны сақтап, жалпы соманы жинақтайтын “ақша жинайтын құты” жобасын іске асыру.

Нәтиже:

![Piggy Bank](../../RESOURCE/014_view.png)

## Жалпы соманы көрсету

Алдымен view ішінде “ақша жинайтын құтының” жалпы сомасын көрсетуіміз керек.

`ContentView` ішінде сол жалпы соманы сақтайтын айнымалы жариялаймыз.

```swift
@State private var amount = 0
```

Содан кейін осы соманы `Text` арқылы көрсетеміз:

```swift
Text("\(amount)")
	.font(.largeTitle)
	.fontWeight(.bold)
```

Мұнда қаріп өлшемі мен жуандығын орнату үшін `.font` және `.fontWeight` қолданылады.

```swift
struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
			.font(.largeTitle)
			.fontWeight(.bold)
		}
    }
}
```

`amount` өзгергенде, `Text` көрсететін жалпы сома да автоматты түрде жаңарады.

## Соманы енгізу

“Ақша жинайтын құты” жалпы соманы көрсетіп қана қоймай, пайдаланушыға ақша сомасын “енгізуге” де мүмкіндік беруі керек. Ол үшін SwiftUI-дің `TextField` view контролы қолданылады.

### TextField

`TextField` — SwiftUI-дегі мазмұн енгізуге арналған view контролы, әдетте бір жолдық енгізу үшін пайдаланылады.

`TextField` негізінен екі түрлі binding форматын ұсынады:

**1. Жол типін (`String`) байланыстыру**

```swift
TextField("Placeholder", text: $text)
```

Бұл ат, тақырып сияқты мәтіндік енгізулерге қолайлы.

**2. Сандық типті (`Int/Double`) байланыстыру**

```swift
TextField("Amount", value: $number, format: .number)
```

Бұл жас, жалақы, ақша сомасы сияқты сан енгізуге ыңғайлы.

`format: .number` енгізу өрісі мазмұнды “сан форматында” талдап, көрсететінін білдіреді.

#### Мәтіндік placeholder

`TextField`-тің бірінші параметрі — placeholder, яғни пайдаланушыға не енгізу керегін көрсететін мәтін:

```swift
TextField("input your name", text: $text)
```

Енгізу өрісі бос кезде сұр түсті ескерту мәтіні көрінеді.

![textfield](../../RESOURCE/014_textfield.png)

#### Дерек байланысы

`TextField` енгізілген мазмұнды өзі тұрақты түрде сақтамайды, сондықтан деректі binding айнымалы арқылы басқару керек.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Пайдаланушы енгізген мазмұн тікелей `text` айнымалысына сақталады, ал `TextField` тек енгізу интерфейсіне жауап береді.

`$` — binding (байланыс) дегенді білдіреді:

```swift
$text
```

Бұл жай айнымалы емес, `Binding` типі.

Оның міндеті — view мен деректің арасындағы байланысты орнату:

Пайдаланушы `TextField` ішіне мәтін енгізгенде, `text` автоматты түрде жаңарады; ал `text` өзгерген кезде, `TextField` те бірге жаңарады.

Мысалы:

```swift
struct ContentView: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
			Text("text:\(text)")
        	TextField("input your name", text: $text)
            	.frame(width: 150)
		}
    }
}
```

`TextField` ішінде енгізілген мазмұн жоғарыдағы `Text` ішінде нақты уақытта бірге көрінеді.

![textField](../../RESOURCE/014_textfield1.png)

### Сандық типті байланыстыру

Егер сан енгізу қажет болса, соған сәйкес типтегі айнымалыны байлау керек:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

Пайдаланушы сома енгізген кезде, `TextField` сол мазмұнды сан ретінде талдап, `number` мәнін автоматты түрде жаңартады.

## Енгізу өрісін қосу

`TextField`-тің негізгі қолданылуын түсінгеннен кейін, оны “ақша жинайтын құты” жобасына қолданамыз.

“Ақша жинайтын құты” ішінде “сома” енгізу керек болғандықтан, біз “сандық типті байланыстыру (`Int/Double`)" тәсілін қолданамыз және пайдаланушы енгізген соманы сақтау үшін `number` айнымалысын қосамыз:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
		}
    }
}
```

Қазір `TextField` әдепкі түрде `number` мәнін көрсетеді (әдепкі мәні — 0).

Егер енгізілген мазмұн тазартылса, `"Amount"` placeholder-ы көрсетіледі.

Бұл да `TextField` өзінің мазмұнын емес, binding арқылы байланысқан айнымалының мәнін көрсететінін дәлелдейді.

### Енгізу өрісінің өлшем мәселесі

Ағымдағы view ішінде біз `TextField`-тің жақтауы жоқ екенін, тек `0` көрсетіп тұрғанын және мазмұны солға тураланғандай көрінетінін байқаймыз.

Нәтиже:

![textfield](../../RESOURCE/014_textfield2.png)

Себебі `TextField` әдепкіде ата-аналық view-дің бүкіл енін алып тұрады.

Мұны фон түсін қосып тексеруге болады:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Нәтиже:

![textfield](../../RESOURCE/014_textfield3.png)

Бұл жерде `TextField` шынымен бүкіл жол енін алып тұрғанын көреміз.

### Тұрақты ен орнату

Егер енгізу өрісі ықшамырақ болсын десек, енін `frame` арқылы шектей аламыз:

```swift
TextField("Amount", value: $number, format: .number)
	.frame(width: 100)
```

Нәтиже:

![textfield](../../RESOURCE/014_textfield4.png)

### Жақтау және ішкі шегініс қосу

`TextField`-те әдепкі түрде жақтау жоқ болғандықтан, стилін қолмен беруге болады:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Енді бұл енгізу өрісі кәдімгі “стандартты енгізу өрісіне” көбірек ұқсайды.

![textfield](../../RESOURCE/014_textfield5.png)

## Жақтау

SwiftUI-де `border` view-ге жақтау қосу үшін қолданылады.

Негізгі қолданылуы:

```swift
border(Color.black, width: 1)
```

Мұндағы `Color.black` — жақтаудың түсі, ал `width` — оның қалыңдығы.

`TextField` ішінде біз мынадай жазуды қолданамыз:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Бұл енгізу өрісіне қара түсті, қалыңдығы `1 pt` болатын жақтау қосатынын білдіреді.

Қаласаңыз `Color.blue`, `Color.green` сияқты басқа түстерді де байқап көруге болады немесе `width: 2` деп жақтауды жуандатуға болады.

## Ақша салу батырмасы

Қазір бізде жалпы соманы көрсетуге арналған `amount` айнымалысы, сома енгізуге арналған `TextField`, және сол өріске байланысқан `number` айнымалысы бар.

Ағымдағы код:

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
			Text("\(amount)")
            	.font(.largeTitle)
            	.fontWeight(.bold)
        	TextField("Amount", value: $number, format: .number)
            	.frame(width: 100)
            	.padding(5)
            	.border(Color.black, width: 1)
		}
    }
}
```

### Батырма қосу

Енді ақша салу әрекетін іске қосатын батырма қосуымыз керек.

```swift
Button("Save") {
    
}
```

### Ақша салу логикасын іске асыру

Біздің мақсатымыз — пайдаланушы сома енгізіп, батырманы басқанда, сол сома автоматты түрде жалпы сомаға қосылсын.


```swift
Button("Save") {
    amount += number
}
```

Мұнда “құрама меншіктеу операторы” қолданылады: пайдаланушы енгізген `number` сомасы жалпы `amount` сомасына қосылады.

### Енгізілген соманы қайта орнату

Қазір бір мәселе бар: батырманы басқаннан кейін, енгізу өрісіндегі сома тазаланбайды.

Пайдаланушы 10 енгізіп, сақтау батырмасын басса, енгізу өрісінде әлі де 10 қалады, бұл келесі енгізуге кедергі келтіреді.

Себебі `TextField` `number`-ге байланысқан, ал батырманы басқанда біз тек `amount`-ты өзгерттік, `number` өзгерген жоқ. Сондықтан енгізу өрісі бұрынғы мәнді көрсетіп тұр.

Сондықтан тазарту логикасын қосуымыз керек: батырма басылғаннан кейін, алдымен сома жалпы сомаға қосылады, содан кейін енгізілген мән қайта орнатылады:

```swift
Button("Save") {
    amount += number
	number = 0
}
```

Енді пайдаланушы сома енгізіп, батырманы басқанда, енгізілген сома жалпы сомаға қосылады. `number` қайтадан 0 болады, осылайша келесі енгізуге дайын тұрады.

Осылайша біз “ақша жинайтын құтының” ақша салу логикасын толық іске асырдық.

## View-ді жақсарту

Функция дайын болғаннан кейін, интерфейсті аздап жақсартуға болады: фон суретін және батырма стилін қосамыз.

Батырма стилін қосу:

```swift
.buttonStyle(.borderedProminent)
```

Фон суретін қосу:

```swift
.background {
    Image("1")
}
```

Осылайша “ақша жинайтын құты” жобасының әзірлеуі аяқталады.

## Толық код

```swift
struct ContentView: View {
    
    @State private var amount = 0
    @State private var number = 0
    
    var body: some View {
        VStack {
            Text("\(amount)")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("Amount", value: $number, format: .number)
                .frame(width: 100)
                .padding(5)
                .border(Color.black, width: 1)
            Button("Save") {
                amount += number
                number = 0
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
    }
}
```

Нәтиже:

![Piggy Bank](../../RESOURCE/014_view.png)

Енді логикада ақау бар-жоғын тексеру үшін 100 не одан да көп ақша салып көруге болады.

Немесе “ақша жинайтын құтыны” симуляторда не нақты құрылғыда іске қосып, өз қолымызбен жасаған қолданбаны байқап көруге болады.

### Жөндеу шығуы

Логиканың дұрыс екенін тексеру үшін, батырмаға жөндеу логикасын қосып, енгізілген соманың дұрыс есептелгенін бақылауға болады:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Әр ақша салған сайын және батырманы басқан сайын, сәйкес жөндеу шығуы көрінеді, соның арқасында код логикасында мәселе бар-жоғын тексере аламыз.

```
---Saving---
amount:11
number:0
```
