# Login Interactions

In the previous lesson, we created a login view and used buttons plus conditional logic to implement simple validation for the input content.

In this lesson, we will continue building on the code from the previous lesson to learn about the `SecureField` password input field, the `Alert` warning box, and how to control the display of different views based on variables.

Through this lesson, you can further understand the basic interaction flow of a login view. This is also core logic commonly used in many apps.

## Password Input Field

In the previous lesson, we used `TextField` to enter a password.

However, in a real login interface, the password is usually not shown directly. Instead, it is displayed as dots or with another hidden effect, which helps protect the user's privacy.

In SwiftUI, the control specifically used for entering passwords is `SecureField`.

For example:

```swift
SecureField("Password", text: $password)
```

Its syntax is very similar to `TextField`. It also needs a placeholder text and a bound variable.

You can simply understand it like this: `SecureField` is also an input field, except that it hides the content being entered.

We can directly change the `TextField` originally used for entering the password into `SecureField`:

```swift
SecureField("input password", text: $password)
    .frame(width: 200)
    .border(Color.gray,width: 1)
```

When the user enters a password, the password content will no longer be shown directly on the interface.

Display effect:

![password](../../Resource/020_password.png)

Now, we can enter the username and password, then click the button to determine whether the input is correct.

### Showing Feedback Messages

Earlier, we kept using `print` to output results.

The content from `print` only appears in the console. Developers can see it when running the program in Xcode, but ordinary users on a phone cannot see these messages.

That means even though the program has already completed the validation, the user still does not know whether the input content is correct.

At this point, we need a way to show messages directly on the interface.

## Alert Warning Box

In SwiftUI, we can use `Alert` to pop up a message box.

Basic usage:

```swift
.alert("Title", isPresented: $isPresented) {
    Button("Button", role: .cancel) {}
} message: {
    Text("Information")
}
```

This code looks a little more complex than the previous controls, but we can understand it by breaking it apart.

`Alert` mainly contains the following parts:

- `"Title"`: the title of the alert box
- `isPresented`: a bound Boolean value used to control whether the alert box is shown
- `Button(...)`: the button in the alert box
- `message:`: the message content shown in the alert box

You can simply understand it like this: when the bound variable becomes `true`, the system will pop up this alert box.

Display effect:

![alert](../../Resource/020_alert3.png)

Corresponding structure:

![alert](../../Resource/020_alert.png)

### Alert Is a Modifier

Like many of the modifiers we learned earlier, `Alert` is also added after a certain view.

For example, it can be attached after a button:

```swift
Button("Sign in") {
	// ...
}
.alert() {...}
```

It can also be attached after the outer `VStack`:

```swift
VStack {
    // ...
}
.alert() {...}
```

That means `Alert` is not a standalone view placed independently on the interface. Instead, it is a modifier attached to a certain view.

You can simply understand it as: `Alert` is usually written after a button or after the outer layout to pop up a message when a certain condition is met.

### Showing Alert

If we want to show an `Alert`, we need a variable to control it.

For example:

```swift
@State private var showAlert = false
```

This variable is of type `Bool`, which means it has only two values: `true` or `false`.

Then bind it to the `isPresented` of `Alert`:

```swift
isPresented: $showAlert
```

When `showAlert` is `false`, the alert box will not be shown. When `showAlert` is `true`, the alert box will pop up.

### Showing the Alert Box Through a Button

Now, let’s first implement the simplest scenario:

When the user enters nothing at all and directly clicks the `Sign in` button, pop up a message box telling them, "You have not entered any content yet."

First, create a variable to control this message box:

```swift
@State private var showEmpty = false
```

Then, add an `Alert` after `Button`:

```swift
Button("Sign in") {
    // ...
}
.alert("Alert", isPresented: $showEmpty) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("No information")
}
```

Next, perform the check in the button click code:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } 
    // ...
}
```

If both `user` and `password` are empty, set `showEmpty` to `true`.

And because `Alert` is bound to this variable, when it becomes `true`, the system will automatically pop up the alert box.

Display effect:

![alert](../../Resource/020_alert1.png)

In this way, after the user clicks the button, they can immediately see the message, and the developer does not need to check the `print` output in the console.

### Improving the Button and Alert Boxes

Earlier, we only handled the case where "nothing was filled in."

We still need to handle the following situations:

- the username is missing
- the password is missing
- both the username and password are filled in, but the input is incorrect

So, we also need to prepare corresponding messages for these cases.

First, add three new variables:

```swift
@State private var showMissUser = false
@State private var showMissPassword = false
@State private var showWrongInfo = false
```

Then continue adding the corresponding `Alert` after the button:

```swift
Button("Sign in") {
	// ...
}
.alert("Alert", isPresented: $showMissUser) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your username.")
}
.alert("Alert", isPresented: $showMissPassword) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Please enter your password.")
}
.alert("Alert", isPresented: $showWrongInfo) {
    Button("Ok", role: .cancel) {}
} message: {
    Text("Username or password verification failed.")
}
```

Next, complete the decision logic inside the button:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
        print("Empty")
        showEmpty = true
    } else if user.isEmpty || password.isEmpty {
        if user.isEmpty {
            print("Please enter your username.")
            showMissUser = true
        } else if password.isEmpty {
            print("Please enter your password.")
            showMissPassword = true
        }
    } else {
        if user == userID && password == passWord {
            print("Success")
        } else {
            print("Input error")
            showWrongInfo = true
        }
    }
}
```

When the button determines that the user filled in no information, left one piece of information blank, or failed input validation, it changes the corresponding Boolean variable to `true`, and then the corresponding `Alert` pops up.

Here, I recommend that you test several situations yourself:

- fill in nothing
- fill in only the username
- fill in only the password
- fill in both the username and password, but with incorrect content
- fill in both the username and password, and the content is correct

This helps verify whether our code has any problems. It is also a very important "testing" step in app development.

If the program behaves incorrectly in a certain scenario, it means there may be a problem in the logic, and a `Bug` has appeared in the program.

What developers often call a `Bug` refers to an error, flaw, or behavior that does not match expectations.

## Completing the Login View

The `Alert` examples we talked about earlier were all about how to give the user feedback when "the input is wrong."

When the user enters the correct username and password, we usually do not pop up a "warning box." Instead, we directly enter the interface after login.

This involves a very important concept: **displaying different views based on the value of a variable.**

For example:

```swift
@State private var login = false

if login {
	Text("Personal View")
} else {
	Text("Login View")
}
```

Here, we use the `Bool` type to manage what view is shown:

- if `login` is `true`, it means login has already succeeded, and the post-login content is shown
- if `login` is `false`, it means login has not succeeded, and the login interface continues to be shown.

Although the `if` statement is a conditional statement in Swift, inside the `body` of SwiftUI it can be used to control the display logic of views.

That means SwiftUI determines which view should currently be shown based on the result of the condition.

We can place this display logic into the current `ContentView`:

```swift
struct ContentView: View {
	@State private var login = false
	var body: some View {
    	if login {
    	    Text("Login successful")
    	} else {
			// Original login view code
		}
	}
}
```

Here, we added a new variable, `login`, to indicate whether the user has already logged in successfully.

Then, we placed the login view code we already wrote after the `else` statement.

View display logic:

- when `login` is `false`, it means login has not succeeded yet, so the original login view continues to be shown.
- when `login` is `true`, it means login is successful. At this time, the login view is no longer shown, and `Login successful` is shown instead.

That means `ContentView` will show different view content depending on the value of `login`.

Next, let’s modify the login success logic inside the button:

```swift
Button("Sign in") {
    if user.isEmpty && password.isEmpty {
		// code
    } else if user.isEmpty || password.isEmpty {
		// code
    } else {
        if user == userID && password == passWord {
            print("Success")
            login = true
        } else {
			// code
        }
    }
}
```

When the username and password entered by the user are both correct, we set `login` to `true`.

Once the value of `login` changes, the result of the `if` check in `ContentView` also changes, and the interface switches from the original login view to `Login successful`.

The display effect is as follows:

![view](../../Resource/020_view.png)

Now, we have truly applied the idea of "displaying different views based on conditions" to this current login page.

In real apps, this is usually how it works as well: different views are shown based on a certain value.

For example, when the user is not logged in, the login page is shown. After the user logs in successfully, another interface is shown.

The core idea is: **use changes in variables to control what content the interface displays.**

## Summary

In this lesson, we learned three important things:

1. Use `SecureField` to enter passwords so that the password content is not directly shown on the interface.
2. Use `Alert` to show prompt messages to the user instead of only outputting them in the console.
3. Use variables and `if` conditions to control the display of different views, making it possible to switch between the pre-login and post-login interfaces.

By learning these concepts, we are now able to complete a login view with basic interaction effects and further understand the SwiftUI development idea of "when state changes, the interface updates."

## Complete Code

```swift
struct ContentView: View {
    @State private var user = ""
    @State private var password = ""
    @State private var showEmpty = false
    @State private var showMissUser = false
    @State private var showMissPassword = false
    @State private var showWrongInfo = false
    @State private var login = false
    let userID = "FangJunyu"
    let passWord = "123456"
    var body: some View {
        if login {
            Text("Login successful")
        } else {
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
                    SecureField("input password", text: $password)
                        .frame(width: 200)
                        .border(Color.gray,width: 1)
                }
                Button("Sign in") {
                    if user.isEmpty && password.isEmpty {
                        print("Empty")
                        showEmpty = true
                    } else if user.isEmpty || password.isEmpty {
                        if user.isEmpty {
                            print("Please enter your username.")
                            showMissUser = true
                        } else if password.isEmpty {
                            print("Please enter your password.")
                            showMissPassword = true
                        }
                    } else {
                        if user == userID && password == passWord {
                            print("Success")
                            login = true
                        } else {
                            print("Input error")
                            showWrongInfo = true
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert", isPresented: $showEmpty) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("No information")
                }
                .alert("Alert", isPresented: $showMissUser) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your username.")
                }
                .alert("Alert", isPresented: $showMissPassword) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Please enter your password.")
                }
                .alert("Alert", isPresented: $showWrongInfo) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text("Username or password verification failed.")
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
```

## Extended Knowledge - Alert with Multiple Buttons

In the earlier part of this lesson, we used the most basic `Alert`, which has only one button and is mainly used to prompt the user.

In fact, `Alert` can also contain multiple buttons so that the user can make different choices.

For example:

```swift
Button("Sign in") {
	showAlert = true
}
.alert("Alert", isPresented: $showAlert) {
    Button("Ok") {
        print("click Ok")
    }
    Button("delete", role: .destructive) {
        print("click delete")
    }
    Button("cancel", role: .cancel) {
        print("click cancel")
    }
} message: {
    Text("Delete the file?")
}
```

After clicking the button, a prompt box with three options will pop up: `Ok`, `delete`, and `cancel`.

Display effect:

![alert](../../Resource/020_alert2.png)

Clicking different buttons will execute the corresponding code.

### The `role` Property of Button

Here you will notice that the `Button` inside `Alert` is a little different from the normal button syntax we learned earlier:

```swift
Button("delete", role: .destructive) {
    print("click delete")
}
```

Here there is an extra `role` parameter.

In SwiftUI, `role` is used to tell the system what kind of action this button represents.

Some common roles are:

- `.cancel`: a cancel action
- `.destructive`: a dangerous action, such as deleting
- `nil`: a normal action

Different `role` values usually also lead to different visual styles in the interface.

For example, dangerous actions are often shown in a more eye-catching style to remind users to click carefully.

In addition, `role` also provides extra semantic information for the button, making it easier for screen readers, such as VoiceOver on Apple devices, to explain the button’s purpose to the user.

So, in appropriate situations, adding `role` to a button is a very good habit.
