# Piggy Bank

In this lesson, we will build a simple "piggy bank" project. The functionality is simple, but it includes a complete interaction flow, which makes it very suitable for beginners.

Through this project, we will learn `TextField`, `border`, and data binding with `$`.

Our final goal is to build a piggy bank where the user can enter an amount, tap a button to save it, and keep a running total.

Result:

![Piggy Bank](../../RESOURCE/014_view.png)

## Displaying the Total Amount

First, we need to display the total amount in the piggy bank.

In `ContentView`, declare a variable to store the total amount:

```swift
@State private var amount = 0
```

Then use `Text` to display the amount:

```swift
Text("\(amount)")
    .font(.largeTitle)
    .fontWeight(.bold)
```

Here, `.font` and `.fontWeight` are used to control the font size and weight.

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

When `amount` changes, the total displayed by `Text` updates automatically.

## Entering an Amount

Besides displaying the total amount, the piggy bank also needs to let the user input a deposit or withdrawal amount. For that, we need to use SwiftUI's `TextField`.

### `TextField`

`TextField` is a SwiftUI control used to enter text, usually for single-line input.

`TextField` mainly provides two binding styles:

**1. Binding to a string (`String`)**

```swift
TextField("Placeholder", text: $text)
```

This is suitable for names, titles, and other text input.

**2. Binding to a numeric type (`Int` / `Double`)**

```swift
TextField("Amount", value: $number, format: .number)
```

This is suitable for age, salary, amount, and other numeric input.

`format: .number` means this text field parses and displays the input using a numeric format.

#### Placeholder Text

The first parameter of `TextField` is the placeholder, which is used to hint to the user what to input:

```swift
TextField("input your name", text: $text)
```

When the text field is empty, a gray hint appears.

![textfield](../../RESOURCE/014_textfield.png)

#### Data Binding

`TextField` itself does not persist the input. It needs a bound variable to manage the data.

```swift
@State private var text = ""
TextField("Placeholder", text: $text)
```

Whatever the user types is stored directly in `text`. `TextField` is only responsible for the input interface.

`$` represents a binding:

```swift
$text
```

This is not an ordinary variable. It is a value of type `Binding`.

Its role is to connect the view and the data:

When the user types into `TextField`, `text` updates automatically. When `text` changes, the `TextField` also updates automatically.

For example:

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

When you type into the text field, the `Text` above updates in real time.

![textField](../../RESOURCE/014_textfield1.png)

### Binding a Numeric Type

When numeric input is needed, the bound variable must use the corresponding numeric type:

```swift
@State private var number = 0

TextField("Amount", value: $number, format: .number)
```

When the user enters an amount, `TextField` parses the input and automatically updates the value of `number`.

## Adding the Input Field

Now that we understand the basic usage of `TextField`, we can apply it to the piggy bank project.

Because the piggy bank needs an amount input, we use the numeric binding form and add another variable named `number` to store the user's input:

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

Now `TextField` displays the current value of `number` by default, which is `0`.

When the content is cleared, the placeholder `Amount` appears.

This also shows again that `TextField` displays the value of the bound variable. It does not store the content by itself.

### The Size Problem of the Input Field

In the current view, we will notice that the `TextField` has no border and only shows a `0`, with its content aligned to the left.

The effect looks like this:

![textfield](../../RESOURCE/014_textfield2.png)

This is because `TextField` occupies the full width of its parent view by default.

We can verify that by adding a background color:

```swift
TextField("Amount", value: $number, format: .number)
    .background(Color.red)
```

Result:

![textfield](../../RESOURCE/014_textfield3.png)

You can see that `TextField` actually fills the entire row.

### Setting a Fixed Width

If we want the input field to be more compact, we can use `frame` to limit its width:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
```

Result:

![textfield](../../RESOURCE/014_textfield4.png)

### Adding a Border and Inner Padding

Since `TextField` has no border by default, we can style it manually:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

Now this input field looks more like a standard input box.

![textfield](../../RESOURCE/014_textfield5.png)

## Border

In SwiftUI, `border` is used to add a border to a view.

Basic usage:

```swift
border(Color.black, width: 1)
```

Here, `Color.black` is the border color, and `width` is the border thickness.

In the `TextField`, we used:

```swift
TextField("Amount", value: $number, format: .number)
    .frame(width: 100)
    .padding(5)
    .border(Color.black, width: 1)
```

This means adding a black border of `1 pt` to the input field.

You can also try other colors such as `Color.blue` or `Color.green`, or make the border thicker with `width: 2`.

## The Save Button

Now we have:

- `amount` for the total amount
- a `TextField` for entering an amount
- `number` bound to that text field

The code so far is:

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

### Adding a Button

Next, we need to add a button to trigger the saving action.

```swift
Button("Save") {
    
}
```

### Implementing the Save Logic

We want the user to enter an amount, tap the button, and have that amount added to the total.

```swift
Button("Save") {
    amount += number
}
```

Here, we use the compound assignment operator to add the user's input `number` to the total `amount`.

### Resetting the Input Amount

Now there is a problem: after tapping the button, the input field does not clear.

If the user enters `10` and taps Save, the text field still shows `10`, which affects the next deposit.

That is because the `TextField` is bound to `number`. When the button is tapped, we only changed `amount`, while `number` did not change, so the text field continues to show the old value.

We need to add a reset step. After the amount is added to the total, the input amount should be cleared:

```swift
Button("Save") {
    amount += number
    number = 0
}
```

Now when the user enters an amount and taps the button, the input amount is added to the total, and `number` is reset to `0` so the user can enter the next amount.

At this point, we have completed all the deposit logic for the piggy bank.

## Improving the View

After the functionality is complete, we can make some simple UI improvements by adding a background image and a button style.

Add a button style:

```swift
.buttonStyle(.borderedProminent)
```

Add a background image:

```swift
.background {
    Image("1")
}
```

Now we have finished building the piggy bank.

## Complete Code

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

Result:

![Piggy Bank](../../RESOURCE/014_view.png)

Now we can try depositing `100` or more to test whether the piggy bank logic has any problems.

Or we can run the piggy bank on the simulator or a physical device and try the app we built ourselves.

### Debug Output

To verify whether the logic is correct, we can also add some debug output inside the button:

```swift
Button("Save") {
    print("---Saving---")
    amount += number
    number = 0
    print("amount:\(amount)")
    print("number:\(number)")
}
```

Each time we save money and tap the button, we can look at the corresponding output and check whether the code logic is correct.

```text
---Saving---
amount:11
number:0
```
