# struct and class

In the previous lesson, we had just started getting in touch with `struct`, defined a structure, and also expanded our learning to topics such as protocols, `UUID`, and more.

Now, we already have a preliminary understanding of the `struct` keyword, but we still cannot say that we truly understand it.

In this lesson, we will continue to focus on `struct`, and along the way we will also get to know `class`. Through this lesson, you will understand more clearly: what an instance is, what a constructor is, and why we can use `struct` and `class` to organize data.

## Student Management System

For example, suppose we now want to develop a student management system. Each student has information such as name, sex, phone number, age, home address, and so on.

At this point, we can combine this information together and define it as a `Student` structure:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

Here, we use `struct` to define a student type.

This `Student` structure contains several properties:

- `id`: the unique identifier of the student
- `name`: the student's name
- `sex`: the student's sex
- `phone`: the student's phone number
- `age`: the student's age
- `address`: the home address

In this way, multiple pieces of data that were originally scattered are combined into one complete "student".

Here, `Student` also conforms to the `Identifiable` protocol and defines an `id` field, making it convenient to display data later together with a `ForEach` loop.

Then, we can create a student instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

This code means that, based on the `Student` structure, we can create a specific student record.

Among them, `Student` is the type, and `Student(...)` represents a created instance.

In SwiftUI, we can assign this instance to a variable and then display it.

For example:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}

struct ContentView: View {
    let student = Student(name: "Fang Junyu",
                          sex: "man",
                          phone: "123456",
                          age: 18,
                          address: "China, Shandong, Rizhao")
    
    var body: some View {
        Text(student.name)
    }
}
```

This way, we can see this student's name in the view: `Fang Junyu`.

Here, we first created a `Student` instance, then assigned it to the `student` variable, and finally read its property through `student.name`.

## What Is an Instance

When we first start learning `struct`, the word "instance" may feel unfamiliar.

But in fact, we have been using instances from the very beginning, we just did not pay special attention to them before.

For example:

```swift
let name = "Fang Junyu"
```

Here, `"Fang Junyu"` is a string value, and in essence it is an instance of the `String` type.

We can also write it like this:

```swift
let name = String("Fang Junyu")
```

These two ways of writing express the same thing: creating an instance of the `String` type and assigning it to the variable `name`.

Similarly, the same is true for `Int`:

```swift
let num = 3
```

Here, `3` is essentially a value of the `Int` type, and it can also be understood as an `Int` instance.

So, an instance is not some special concept that appears only in `struct`.

Whether it is `String`, `Int`, `Double`, `Bool`, or the custom `Student`, all of them can create instances.

Therefore, when we write:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

it is essentially the same as creating an instance of `String` or `Int`, except that `Student` is a type we defined ourselves.

## Constructor

When we create an instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

we are actually calling the initialization method of `Student`, which is `init`.

You can understand a constructor as: **the entry point responsible for assigning values to properties when an instance is created.**

That is to say, before an instance is truly finished being created, it usually has to go through `init` first.

For example, when we previously learned the SwiftUI view lifecycle, we wrote code like this:

```swift
struct ContentView: View {
    init() {
        print("Create ContentView")
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
        .onAppear {
            print("Show ContentView")
        }
    }
}
```

Here, `init()` runs when the `ContentView` instance is created, while `onAppear` runs only when the view is actually displayed on the screen. In other words, creating a view and displaying a view are not the same moment.

Likewise, when we create `Student(...)`, we are calling the constructor of `Student`.

### Constructor Automatically Generated by the System

When we defined `Student`, we did not manually write `init`:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
}
```

However, we can still directly create an instance:

```swift
Student(name: "Fang Junyu",
        sex: "man",
        phone: "123456",
        age: 18,
        address: "China, Shandong, Rizhao")
```

Why can we create an instance without writing a constructor?

Because for `struct`, if we do not manually write a constructor, the system will usually automatically generate a suitable constructor for us.

At the beginner stage, you can simply understand it as: Swift automatically fills in the initialization code for us.

Roughly speaking, you can understand it as the system filling in the following code for us:

```swift
struct Student: Identifiable {
    let id = UUID()
    let name: String
    let sex: String
    let phone: String
    let age: Int
    let address: String
    
    init(name: String, sex: String, phone: String, age: Int, address: String) {
        self.name = name
        self.sex = sex
        self.phone = phone
        self.age = age
        self.address = address
    }
}
```

There is one detail to pay attention to here:

```swift
let id = UUID()
```

`id` already has a default value, so when creating an instance, we do not need to manually pass in `id` again.

That is to say, properties without default values usually need to be passed into the constructor; properties that already have default values can usually just use their original default values directly.

Therefore, when we create a `Student` instance, we only need to pass in `name`, `sex`, `phone`, `age`, and `address`.

### Compiler Hints

In addition, when we type `Student(...)` in Xcode, we can also see the parameter hints provided by the system.

![student](../../Resource/022_student.png)

This also shows that the current type really does have a constructor automatically generated by the system.

### Writing a Constructor Ourselves

Although the system can automatically generate a constructor, sometimes this default initialization method does not completely match our needs.

For example, we have a `Movie` structure:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

According to the constructor automatically generated by the system, when we create an instance, we must pass in all three of these parameters at the same time:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

But if we now want to enter a batch of old movies and only know the movie names, but do not know the director or rating, that becomes inconvenient.

Because then we can only write it like this:

```swift
Movie(name: "The Night of the Hunter", director: "--", rating: "--")
Movie(name: "Picnic at Hanging Rock", director: "--", rating: "--")
Movie(name: "Days of Heaven", director: "--", rating: "--")
```

Although this works, repeatedly writing `--` every time is not convenient.

At this point, we can write a constructor:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

This way, when we create old movies, we only need to pass in `name`:

```swift
Movie(name: "The Night of the Hunter")
Movie(name: "Picnic at Hanging Rock")
Movie(name: "Days of Heaven")
```

This is one meaning of writing a constructor ourselves: **making the way instances are created better fit actual needs.**

### Understanding a Custom Constructor

Let's look at the constructor we just wrote by hand:

```swift
init(name: String) {
    self.name = name
    self.director = "--"
    self.rating = "--"
}
```

What this code means is that when creating a `Movie` instance, we only need to pass in one parameter, `name`.

Then, inside the constructor, the passed-in `name` will be assigned to the instance's own `name`, and `director` and `rating` will be given a default value of `--`.

Here, `self` means "this current instance itself".

For example:

```swift
self.name = name
```

The `self.name` on the left refers to the property in the instance; the `name` on the right refers to the parameter we passed in.

You can simply understand it as storing the value passed from outside into the instance's own property.

When all properties have been assigned values, the creation of this instance is complete.

### Constructor Mechanism

When we explicitly declare a constructor, another change also happens:

the constructor that the system originally generated automatically usually can no longer be used directly.

For example:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

Now if we write this again:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

the compiler will report an error:

```swift
Extra arguments at positions #2, #3 in call
```

It means: you passed in extra parameters.

Why does this error appear?

Because in the current `Movie` structure, there is only this one constructor that you manually declared:

```swift
init(name: String)
```

It only accepts one parameter, `name`, and does not accept `director` or `rating`.

That is to say, after you manually add your own constructor, the initialization style originally generated automatically can no longer be used directly.

If we want to support both "only passing in the name" and "passing in complete information", then we need to add another complete constructor ourselves:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String

    init(name: String, director: String, rating: String) {
        self.name = name
        self.director = director
        self.rating = rating
    }

    init(name: String) {
        self.name = name
        self.director = "--"
        self.rating = "--"
    }
}
```

This way, we have two different constructors.

When creating an old movie, we can write it like this:

```swift
Movie(name: "The Night of the Hunter")
```

When creating a new movie with complete information, we can write it like this:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

This way of writing also shows that the same type can have multiple constructors, as long as their parameter forms are different.

## What Is Overloading

Here we will add one more necessary knowledge point.

Just now, we wrote two `init` methods for `Movie`:

```swift
init(name: String, director: String, rating: String)
init(name: String)
```

This way of writing, "the same function name but different parameters", is called "overloading".

Here, both functions are called `init`, but because they accept different parameters, Swift can tell which function you are calling.

For example:

```swift
Movie(name: "Days of Heaven")
```

will call:

```swift
init(name: String)
```

While:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

will call the other complete version of the initialization method.

So, the role of overloading is: allowing the same type to provide different ways to create itself according to different situations.

## Getting to Know class

Next, let's briefly get to know `class`.

Besides the common `struct` in Swift, many programming languages use `class` to create instances, such as Java, C#, Kotlin, and so on.

In Swift, the syntax of `class` is very close to that of `struct`.

For example:

```swift
class Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String

    init(id: UUID = UUID(), name: String, director: String, rating: String) {
        self.id = id
        self.name = name
        self.director = director
        self.rating = rating
    }
}
```

You will notice that except for the keyword changing from `struct` to `class`, the other parts look almost the same.

The way to create an instance is also very similar:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10")
```

So, at the syntax level, `struct` and `class` really are very similar.

### The Difference Between Struct and Class

Although `struct` and `class` look very similar, they are not exactly the same.

**1. Their initialization methods are different**

For `struct`, if we do not manually write a constructor, the system will usually automatically generate a suitable initialization method.

But for `class`, if there are properties that do not yet have default values, we usually need to manually write `init`, otherwise an error will occur.

For example:

```swift
class Movie {
    let name: String
    let director: String
    let rating: String
}
```

This `class` causes an error because it has no constructor, so its properties are not initialized.

The compiler will show something like:

```swift
Class 'Movie' has no initializers
```

So in this example, `class` must have a manually written constructor.

**2. `struct` is a value type, `class` is a reference type**

`struct` is a value type, and `class` is a reference type.

At the beginner stage, you do not need to fully master these two concepts. It is enough to have a simple understanding of them.

For example, `struct` is more like "copying a new value".

```swift
struct User {
    var name: String
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Tom
print(user2.name) // Jack
```

Here, after assigning `user1` to `user2`, it is like copying a new piece of data, so modifying `user2` does not affect `user1`.

On the other hand, `class` is more like "pointing to the same instance together".

```swift
class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var user1 = User(name: "Tom")
var user2 = user1

user2.name = "Jack"

print(user1.name) // Jack
print(user2.name) // Jack
```

Here, `user1` and `user2` point to the same instance.

Right now, we do not need to fully understand the underlying mechanism of value types and reference types. We only need to know that `struct` is more suitable for storing independent data, while `class` is more suitable when multiple places need to share the same instance.

## How to Choose at the Beginner Stage

At the current stage, for ordinary data models, consider `struct` first; when you need shared data and synchronized changes, then consider `class`.

This is not an absolute rule, but for beginners, it is a practical enough way to judge.

Especially in SwiftUI, you will often find that `struct` can already handle most of the work.

In addition, in many programming materials, what is created by `class` is also called an "object". At the beginner stage, you can first understand it as an instance, without deliberately distinguishing between them.

## Summary

In this lesson, we studied `struct` more deeply and also got to know `class` along the way. Both can be used to define types.

Types can create instances. When an instance is created, the constructor, that is, `init`, is called.

For `struct`, if we do not manually write a constructor, the system will usually automatically generate a suitable constructor. If the default constructor does not meet our needs, we can also write a constructor ourselves.

In addition, we also gained a preliminary understanding of the difference between `struct` and `class`: `struct` is a value type, while `class` is a reference type. In SwiftUI, at the beginner stage, the one you usually encounter more often is `struct`.

Later, when we learn about passing values between views, data models, and state management, all of this content will continue to be used.
