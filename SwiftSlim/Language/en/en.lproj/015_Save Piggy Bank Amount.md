# Saving the Piggy Bank Amount

In the previous lesson, we built a simple piggy bank. In this lesson, we will learn how to make the piggy bank amount persist after the app is closed.

This lesson mainly covers `UserDefaults` and the `@AppStorage` property wrapper. It also extends the discussion to the role of `onAppear` and the usage of optional values (`nil`).

Please note that this lesson continues from the piggy bank code built in the previous lesson.

## The Problem of Persistence

Now the piggy bank interface is very simple and easy to use.

![Piggy Bank](../../Resource/014_view.png)

However, there is one obvious problem: every time the view refreshes or the app is closed, the total amount goes back to `0`, and all previously saved money is lost.

This means the data is not truly being saved. In other words, the current piggy bank can only store temporary data.

### Why Can't It Persist?

That is because we declared the variable with `@State`:

```swift
@State private var amount = 0
```

A variable declared with `@State` depends entirely on the lifecycle of the view.

When the view is created, `amount` is initialized to `0`. When the view is destroyed, `amount` is destroyed as well.

So the data stored in `amount` only exists in memory. It is not saved to the device.

But we do not want `amount` to be tied only to the view's lifetime. We want to persist it to the device.

### What Is Data Persistence?

Data persistence can be understood as saving data from temporary memory into device storage.

Then when the view is closed or the app is closed, the data is not lost.

In Swift development, simple persistence can be handled with `UserDefaults`, while more complex data usually uses `SwiftData` or `CoreData`.

In this lesson, we will first learn the simplest option: `UserDefaults`.

## UserDefaults

`UserDefaults` is used to store lightweight key-value data. It is commonly used to save basic types such as `String`, `Int`, `Double`, and `Bool`.

### Saving Data

`UserDefaults` uses the `set` method to save data:

```swift
UserDefaults.standard.set("FangJunyu", forKey: "name")
UserDefaults.standard.set(28, forKey: "age")
UserDefaults.standard.set(true, forKey: "isMember")
```

The first parameter is the data to store. In these examples, it is `String`, `Int`, and `Bool`.

The second parameter, `forKey`, works like a variable name and identifies the stored value in `UserDefaults`.

### Reading Data

`UserDefaults` uses corresponding methods to read data:

```swift
let name = UserDefaults.standard.string(forKey: "name")    // FangJunyu
let age = UserDefaults.standard.integer(forKey: "age")     // 28
let isMember = UserDefaults.standard.bool(forKey: "isMember") // true
```

When reading data, you must use the method that matches the data type. Otherwise, you may get incorrect results or errors.

### Notes About UserDefaults

#### 1. Optional Return Values

When reading data from `UserDefaults`, some methods return optional values.

For example:

```swift
let name = UserDefaults.standard.string(forKey: "name")
```

The type of `name` is:

```swift
String?
```

This means it may contain a value, or it may contain nothing.

**Why does it return an optional?**

Because a certain key in `UserDefaults` may not exist at all.

For example:

```swift
let name = UserDefaults.standard.string(forKey: "City") // nil
```

If the key `"City"` has never been saved before, the result is:

```swift
nil
```

It is important to emphasize that `nil` means there is no data, not an empty string.

We encountered something similar in the Type System lesson. When type conversion fails, Swift also returns an optional.

At that point, we can use `??` to provide a default value and unwrap it:

```swift
let name = UserDefaults.standard.string(forKey: "City") ?? "Rizhao"
```

If `UserDefaults` reads a value, use that value. If it reads nothing and returns `nil`, use the default value instead.

#### 2. Non-Optional Return Values

When reading `Int`, `Double`, and `Bool` from `UserDefaults`, the methods return non-optional types.

For example:

```swift
let num = UserDefaults.standard.integer(forKey: "num")    // 0
let height = UserDefaults.standard.double(forKey: "height")   // 0.0
let isBuyCar = UserDefaults.standard.bool(forKey: "isBuyCar") // false
```

Even if these keys have never been saved before, the result is not `nil`.

Instead, Swift returns default values:

```text
Int -> 0
Double -> 0.0
Bool -> false
```

#### 3. Data Size Limitation

`UserDefaults` is only suitable for small amounts of data, such as app settings and simple status values.

In actual projects, it is not suitable for storing large amounts of data or data that needs very frequent reading and writing.

## Saving the Piggy Bank Amount

Now we can use `UserDefaults` to implement the logic for saving the piggy bank's total amount.

When the user taps the button, the entered amount is added to the total, and the total is written into `UserDefaults`.

```swift
Button("Save") {
    amount += number
    number = 0
    UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
}
.buttonStyle(.borderedProminent)
```

At this point, we have implemented the logic for writing data.

## Explaining the Persistence Logic

Even though we have finished the writing logic, if you run the app, you will notice that every time the view refreshes or the app is reopened, `amount` is still `0`.

That is because:

```swift
@State private var amount = 0
```

In SwiftUI, an `@State` variable is re-initialized each time the view is created.

Even though the value of `amount` has already been saved in `UserDefaults`, when the view is reloaded, `amount` is still reset to `0`.

That means the app is only saving data to `UserDefaults`, but it is not restoring the data back into the view.

So when the view loads, we also need to manually read the value from `UserDefaults` and assign it back to `amount`. Only then is the persistence logic complete.

### A Simple Analogy

You can think of this as a classroom blackboard:

During class, the teacher writes content on the blackboard. This is like the current view state stored in `@State`.

When class ends, the blackboard is erased in preparation for the next class. This is like the view being destroyed and the data in `@State` being cleared.

To avoid losing the lesson content, the teacher saves it in course materials beforehand. Those materials are like the data saved in `UserDefaults`.

When the next class starts, the blackboard is empty again, because `@State` is initialized again. The teacher needs to read the course materials and rewrite the content onto the blackboard.

The key point is this: the blackboard does not restore itself automatically. You must read from the saved course materials. Likewise, the view must read from `UserDefaults`.

## Reading Data with `onAppear`

When the view appears, we need to manually read the saved value from `UserDefaults` and assign it to the `@State` variable `amount`, so that the data truly persists.

In SwiftUI, you can use `onAppear` to run initialization logic when the view is shown:

```swift
.onAppear {}
```

Place the code that reads from `UserDefaults` inside `onAppear`:

```swift
.onAppear {
    amount = UserDefaults.standard.integer(forKey: "amount")
}
```

When the view is created, `amount` is first initialized as `0`. Then when the view appears, `onAppear` runs, reads the saved value from `UserDefaults`, and assigns it back to `amount`. This allows the view to display the previously saved total.

At this point, the persistence logic for the piggy bank is complete.

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
                UserDefaults.standard.set(amount, forKey: "amount")    // UserDefaults
            }
            .buttonStyle(.borderedProminent)
        }
        .background {
            Image("1")
        }
        .onAppear {
            amount = UserDefaults.standard.integer(forKey: "amount")
        }
    }
}
```

## The `@AppStorage` Property Wrapper

SwiftUI provides the `@AppStorage` property wrapper, which simplifies the persistence logic of `UserDefaults`.

```swift
@AppStorage("amount") private var amount = 0
```

`@AppStorage` is a wrapper around `UserDefaults`, and `"amount"` corresponds to the key in `UserDefaults`.

When the view is created, it reads the value from `UserDefaults`. When the variable changes, it automatically writes the new value back into `UserDefaults`.

It also works with SwiftUI's state update mechanism. Just like `@State`, when the value changes, the SwiftUI view refreshes.

That means `@AppStorage` handles both reading and writing automatically. We no longer need to manually call `UserDefaults`, and we no longer need to manually restore data in `onAppear`.

So we can replace the `UserDefaults` logic with `@AppStorage`:

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
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

## Summary

This lesson mainly covered the following:

First, `UserDefaults` is used to save lightweight data. We used it to store the total amount of the piggy bank on the device. `UserDefaults` provides methods for reading and writing values, and in some cases we also need to handle optional values.

Second, `@State` is only for managing temporary state in a view, and its lifetime matches the view. When the view is recreated, `@State` is initialized again.

While restoring data from `UserDefaults`, we learned to use `onAppear` to read the value when the view appears.

Finally, we used `@AppStorage` to replace the manual `UserDefaults` logic, so that SwiftUI can automatically read the value when the view loads and automatically write it when the value changes.

With this knowledge, we can already implement a basic app data persistence feature.

## Practice After Class

Now the piggy bank can save the amount, but the feature is still incomplete.

1. If the user wants to withdraw money, you need to design a corresponding withdrawal flow.
2. If the user wants to clear the amount, you also need to implement a reset flow.
3. If you want to add a name to the piggy bank, you need to introduce a `String` type for storing it.

You can continue improving these features based on the current code so that the piggy bank becomes more complete.

## Extended Knowledge - The Default Value Problem in the Input Field

Now we can further improve the interaction of the input field to make input more convenient.

![textfield](../../Resource/015_view.png)

In the current implementation, the default value in the input field is `0`. That means every time the user wants to enter a number, they first need to delete the `0`, which is not a great user experience.

The input field should ideally start empty rather than showing `0`.

That is because `TextField` and `number` are two-way bound:

```swift
@State private var number = 0
TextField("Amount", value: $number, format: .number)
```

When `number` is initialized as `0`, the text field also shows `0`.

So we need to change `number` to an empty value, which means `nil`.

```swift
@State private var number = nil
```

At this point, an error appears:

```text
Generic parameter 'Value' could not be inferred
```

This is exactly the situation we discussed in the Type System lesson: when the variable type cannot be inferred automatically, we must declare it explicitly.

Because `number` is being assigned `nil`, and `nil` itself contains no type information, the compiler cannot tell whether this variable should be `String`, `Int`, or something else.

So we must explicitly declare the type:

```swift
@State private var number:Int? = nil
```

Here, `Int?` means an optional `Int`. That means `number` can either contain an `Int` value, or it can be `nil`.

This way, when the value is initialized as `nil`, the text field appears empty instead of showing `0`.

### Unwrapping the Optional

After changing `number` into an optional type, the old calculation code produces an error:

```swift
amount += number
```

The error says:

```text
Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

That is because `number` can now be `nil`. If we use it directly in a calculation, it would effectively become:

```swift
amount += nil
```

Clearly, `nil` cannot be added to `amount`.

So when an optional is involved in a calculation, we must unwrap it first.

Here we can use `??` to provide a default value:

```swift
amount += number ?? 0
```

If `number` is `nil`, use the default value `0`. If `number` has a value, use the actual entered number.

This ensures that the calculation stays correct while also making the input field empty by default, so the user no longer needs to manually delete a `0`.

## Extended Code

```swift
struct ContentView: View {
    
    @AppStorage("amount") private var amount = 0
    @State private var number:Int? = nil
    
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
                amount += number ?? 0
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
