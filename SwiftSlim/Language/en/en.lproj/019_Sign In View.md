# Sign In View

In this lesson, we will learn a very practical scenario: the sign-in view.

Whether it is a website or an app, in many cases users need to sign in to their account and enter a password while using it.

For example, the GitHub sign-in page:

![WordPress](../../Resource/019_github.png)

In this lesson, we will create a similar sign-in view so users can manually enter an account and password, and we will check whether there is any problem with the input content.

## Top Layout

We will write the code for the sign-in view in the `ContentView` file.

First, let us create the branding area at the top of the sign-in view. You can prepare a suitable icon image first and place it in the `Assets` folder.

![icon](../../Resource/019_icon1.png)

Then use `Image` and modifiers to display the image:

```swift
Image("019_icon")
    .resizable()
    .scaledToFit()
    .frame(width: 100)
```

These modifiers mean:

- `resizable()`: allows the image to be resized.
- `scaledToFit()`: scales the image while keeping its original proportion.
- `frame(width: 100)`: sets the display width of the image to `100`.

Next, use `Text` and modifiers to display the sign-in title:

```swift
Text("Sign in to App")
    .font(.title3)
    .fontWeight(.bold)
```

Then use `VStack` to arrange the image and text vertically:

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
}
```

Result:

![view](../../Resource/019_view.png)

At this point, we have completed the title area at the top of the sign-in view.

### Optimizing the Layout

Right now, the image and title are placed in the middle area of the overall layout by default.

If we want them to look more like a "sign-in mark at the top of the page," we can use `Spacer()` to expand the remaining space and make the content appear closer to the top.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 100)
    Text("Sign in to App")
        .font(.title3)
        .fontWeight(.bold)
    Spacer()
}
```

Result:

![view](../../Resource/019_view1.png)

But now, `Image` and `Text` are too close to the top of the screen, and it looks a little crowded.

At this time, we can use `padding` to add top spacing to the entire `VStack`.

```swift
VStack {
    Image("019_icon")
        .resizable()
        .scaledToFit()
        .frame(width: 60)
    Text("Sign in to App")
        .font(.title)
        .fontWeight(.bold)
    Spacer()
}
.padding(.top, 50)
```

Result:

![view](../../Resource/019_view2.png)

This makes the title area at the top of the page look more appropriate.

## Username and Password

A sign-in page usually requires users to enter a username and password.

In SwiftUI, we can use `TextField` to receive content entered by the user.

But note: `TextField` itself does not store input data for a long time. It is only an input control. What really stores this input content is the variables we bind to it.

Therefore, we first need to create two `@State` variables to store the username and password:

```swift
@State private var user = ""
@State private var password = ""
```

When the value of an `@State` variable changes, SwiftUI automatically refreshes the related views.

Next, use `TextField` to bind these two variables:

```swift
TextField("input user", text: $user)
TextField("input password", text: $password)
```

Here, `$user` and `$password` represent "binding."

That is, when the user types text in the input box, the variable changes at the same time; when the variable changes, the content shown in the input box also changes at the same time.

This relationship, where "the view and the data stay synchronized with each other," is called binding.

Note that here we need to use the form with `$`:

```swift
$user
```

Because `TextField` does not need a normal string, but a binding value that "can modify data in two directions."

### Showing the Input Fields

Let us put them into `ContentView`:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            TextField("input user", text: $user)
            TextField("input password", text: $password)
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Display result:

![view](../../Resource/019_view3.png)

Because `user` and `password` are both empty strings by default right now:

```swift
""
```

the input field will first show placeholder text, such as:

```swift
input user
```

This text only tells the user "what should be entered here," and is not the actual input content.

### Optimizing the Input Fields

Now the input fields can already be used, but the default style is relatively simple.

To make the interface clearer, we can add a title in front of the input field and do some simple styling optimization to the input field itself.

For example, first add a title:

```swift
Text("Username")
    .fontWeight(.bold)
```

Then use `HStack` to place the title and input field on the same line:

```swift
HStack {
    Text("Username")
        .fontWeight(.bold)
    TextField("input user", text: $user)
}
```

We use `HStack` here because we want to "show the title on the left and the input field on the right."

It should be noted that `TextField` will occupy the remaining available space by default.

![color](../../Resource/019_view6.png)

To make the size of the two input fields more consistent, we can use `frame(width:)` to set a width for it, so the input fields look more tidy.

```swift
TextField("input user", text: $user)
    .frame(width: 200)
```

Then add a border to make the input field more obvious:

```swift
TextField("input user", text: $user)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

Now, let us add both the username and password to the `ContentView` view:

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}
```

Display result:

![view](../../Resource/019_view4.png)

At this point, users can already enter a username and password.

## Sign In Button

Next, we add a sign-in button below the input fields.

```swift
Button("Sign in") {

}
```

Then use `buttonStyle` to give the button a more obvious system style:

```swift
Button("Sign in") {

}
.buttonStyle(.borderedProminent)
```

Display result:

![view](../../Resource/019_view5.png)

To confirm that the button can really respond to taps, we can first write a `print` inside the button to test:

```swift
Button("Sign in") {
    print("click Sign in")
}
.buttonStyle(.borderedProminent)
```

When the button is tapped, the console will output:

```swift
click Sign in
```

This shows that the button has successfully responded to the tap action.

## Sign-In Logic

Now, we add the most basic validation logic to the sign-in button: **checking whether the user entered a username and password**.

We want to achieve the following situations:

- If the user entered nothing, output `Empty`
- If the user entered only one of them, tell which one is missing
- If both the username and password are entered, output `Success`

### No Information Entered

Because `user` and `password` are both empty strings by default:

```swift
@State private var user = ""
@State private var password = ""
```

they will still be empty when the user enters nothing.

In Swift, types like `String` can use `isEmpty` to determine whether the content is empty.

### The isEmpty Property

`isEmpty` is often used to check whether strings, arrays, and other content are empty.

For example:

```swift
user = ""
user.isEmpty // true


user = "123"
user.isEmpty // false
```

If the content is empty, `isEmpty` returns `true`; if the content is not empty, it returns `false`.

Therefore, we can use it to determine whether the username and password have input content.

### Using isEmpty to Check Variables

If the user did not enter any information, then:

```swift
user.isEmpty // true
password.isEmpty    // true
```

At this time, we can write the condition like this:

```swift
if user.isEmpty && password.isEmpty {
    print("Empty")
}
```

This code means: if `user` is empty, and `password` is also empty, then output:

```swift
Empty
```

Here, `&&` is a logical operator and means "and."

That is, the whole condition is true only when the left condition is true and the right condition is also true.

Therefore, this code runs only when both the username and password are empty.

## The User Filled Only Part of It

Next, let us consider another situation: the user filled only the username, or only the password.

For example:

```swift
@State private var user = "Fang Junyu"
@State private var password = ""
```

At this time, the username is not empty, but the password is empty.

We can continue to use `isEmpty` to check:

### Situation Where the User Filled the Account or Password

If the user filled only the username or password, we need to give the corresponding missing reminder.

For example, if the user filled only the username:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

The logic of this code is: if the username is empty, ask for the username. Otherwise, check whether the password is empty, and if it is empty, ask for the password.

### The User Filled All Information

If both the username and password have already been entered, then `isEmpty` will return `false` for both of them.

At this time, we can write it like this:

```swift
if !user.isEmpty && !password.isEmpty {
    print("Success")
}
```

Here, `!` means "negation."

For example:

```swift
user.isEmpty    // false
!user.isEmpty    // true
```

That is, `user.isEmpty` is used to determine "whether the username is empty," while `!user.isEmpty` is used to determine "whether the username is not empty."

The password follows the same logic.

So, the meaning of this code is: the username is not empty, and the password is also not empty.

When both conditions are true, the output is:

```swift
Success
```

## Complete Validation Logic

Now, let us combine these three situations and write them into `Button`:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
        } else if password.isEmpty {
            print("Please enter your password.")
        }
    } else {
        print("Success")
    }
}
.buttonStyle(.borderedProminent)
```

The execution order of this code can be understood like this:

First, we check:

```swift
if user.isEmpty && password.isEmpty
```

If both the username and password are empty, it directly outputs `Empty`.

If they are not both empty, then we continue to check this line:

```swift
else if user.isEmpty || password.isEmpty
```

Here, `||` means "or."

That is, as long as one of the conditions is true, the whole condition is true.

Therefore, as long as the username is empty, or the password is empty, the `else if` code block will run.

After entering the code block, we further check which input field was not filled:

```swift
if user.isEmpty {
    print("Please enter your username.")
} else if password.isEmpty {
    print("Please enter your password.")
}
```

If neither of the previous two conditions is true, that means the username is not empty, and the password is also not empty.

Then the program enters the final `else`:

```swift
print("Success")
```

This way, we complete the most basic sign-in input validation logic.

## Username and Password Validation

The logic above only checks "whether content was entered or not."

But in a real app, simply entering content is not enough. Usually, we also need to send the username and password to the server for verification.

If the server confirms that the username exists and the password is correct, it allows sign-in; otherwise, it tells the user that sign-in failed.

To practice this process, we can first set a temporary account and password in the code to simulate "correct sign-in information":

```swift
let userID = "FangJunyu"
let passWord = "123456"
```

When both the username and password are not empty, we then compare whether they are correct:

```swift
if user.isEmpty && password.isEmpty {
    ...
} else if user.isEmpty || password.isEmpty {
    ...
} else {
    if user == userID && password == passWord {
        print("Success")
    } else {
        print("Input error")
    }
}
```

Here, `==` means "whether it is equal."

For example:

```swift
user == userID
```

It means whether the username entered by the user is exactly the same as the correct username we set. Password checking follows the same logic.

Therefore, when the entered username and password are equal to the set values, it outputs `Success`; as long as one of them is not equal, it outputs `Input error`.

This way, we complete a simple "mock sign-in verification."

Although it is not yet a real sign-in feature connected to a server, it is already enough to help us understand: **after the button is tapped, different code can run based on different conditions**.

## Summary

In this lesson, we completed a basic sign-in view and focused on learning "the logic of judging input content based on conditions."

The core content of this lesson is: using `isEmpty` to determine whether a string is empty, and using `if` statements together with logical operators to handle different situations.

Among them, there are two very important logical operators:

- `&&`: means "and," both conditions must be satisfied
- `||`: means "or," only one condition needs to be satisfied

When these conditions finally produce `true` or `false`, the `if` statement executes different code based on the result.

Through this sign-in view, we have already started to work with a development method that combines "interface + data + logical judgment."

## Complete Code

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        VStack {
            Image("019_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
            Text("Sign in to App")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Username")
                    .fontWeight(.bold)
                TextField("input user", text: $user)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            HStack {
                Text("Password")
                    .fontWeight(.bold)
                TextField("input password", text: $password)
                    .frame(width: 200)
                    .border(Color.gray,width: 1)
            }
            Button("Sign in") {
                if user.isEmpty && password.isEmpty {
                    print("Empty")
                } else if user.isEmpty || password.isEmpty {
                    if user.isEmpty {
                        print("Please enter your username.")
                    } else if password.isEmpty {
                        print("Please enter your password.")
                    }
                } else {
                    if user == userID && password == passWord {
                        print("Success")
                    } else {
                        print("Input error")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding(.top, 50)
    }
}

```
