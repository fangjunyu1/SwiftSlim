# Loops and Lists

In this lesson, we will learn about the `for` loop in Swift and `ForEach` in SwiftUI.

Both of them help us read elements in an array one by one in order. In actual development, we often need to take out a group of data one item at a time, then process or display it, and loops are an important tool for doing this.

When we browse websites or use apps, we often see many lists or entries. Content like this is usually stored in an `array` first, then read one by one through a `loop`, and finally displayed on the screen.

For example, the Google search results list:

![Google](../../Resource/017_google.png)

Each entry in the search results list usually corresponds to one piece of data, which is displayed one by one through a loop.

Therefore, `arrays` and `loops` often appear together. An `array` is responsible for storing a group of data, while a `loop` is responsible for taking the data out in order and performing the same operation on it.

Next, let us start with the most basic `for` loop.

## Countdown

Suppose we want to simulate a countdown function and output `“5, 4, 3, 2, 1”` in order.

The most direct way to write it is:

```swift
print(5)
print(4)
print(3)
print(2)
print(1)
```

Although this can simulate a countdown, if there is a lot of content, it becomes very repetitive and is not convenient to modify later.

At this point, we can first put the data into an array, then use a `for` loop to output them one by one:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

This way is more concise and easier to extend. Even if there are many numbers in the countdown, we do not need to write `print` line by line. We just let the loop automatically process each element in the array.

We can put this code into a button to test it:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("for") {
                let countDown = [5, 4, 3, 2, 1]

                for i in countDown {
                    print(i)
                }
            }
        }
    }
}
```

When the button is tapped, the `for` loop will take each integer in `countDown` in order according to the array, and print them to the console.

Next, let us look at how the `for` loop works.

## for Loop

A `for` loop is used to process a group of data in order. The most common objects are arrays and ranges.

Basic syntax:

```swift
for element in arrayOrRange {
    codeToExecute
}
```

For example, the countdown code just now:

```swift
let countDown = [5, 4, 3, 2, 1]

for i in countDown {
    print(i)
}
```

Here, `i` represents the current element being taken out, and what follows `in` is the data to loop through, which is the `countDown` array.

The meaning of this code is: the program will take out each element from the `countDown` array in order. Each time it takes out an element, it temporarily uses `i` to represent it, and then executes the code inside the braces.

The execution process can be understood as:

* The first element taken out is `5`, so at this time the value of `i` is `5`
* Execute `print(i)` and output `5`
* Then continue to take out the next element `4`
* Execute `print(i)` again and output `4`

The later `3`, `2`, and `1` will also be executed one by one in the same way.

![for](../../Resource/017_for.png)

When all elements in the array have been processed, the `for` loop ends automatically.

We can use the `for` loop to get each element in the array and complete functions like this countdown.

**Tip**: `i` is a very common name in a for loop and is used to represent the current element being taken out, but it is not fixed. You can also use other English names.

For example, use `num` to represent each element being taken out:

```swift
for num in countDown {
    print(num)
}
```

Inside the braces, you also need to use `num` to represent the current element being taken out.

### Looping Through a Range

A `for` loop can not only loop through arrays, but also through ranges.

For example, when we need to calculate the sum of positive integers within `50`, we need to add all integers from `1` to `50` one by one.

The most direct way might be:

```swift
let count = 1 + 2 + 3 + ... + 49 + 50
print(count)
```

The problem with this approach is that we need to write every number manually. It is troublesome and not suitable for real development scenarios.

At this point, we can use the range operator together with a `for` loop to complete it.

In the previous “Operators” lesson, we already learned the range operator:

```swift
1...3   // 1, 2, 3
```

Here, `...` represents a closed range, which means it includes both the starting point and the ending point.

So here, we can use a `for` loop with the integer range from `1` to `50`:

```swift
for i in 1...50 {
    
}
```

We need to add these integers together, so we also need a variable to store the total:

```swift
var count = 0
```

Then during each loop, add the current number taken out to `count`:

```swift
var count = 0
for i in 1...50 {
    count += i
}
print(count)	// 1275
```

This code means:

* `count` is used to store the current total
* The `for` loop will take out integers from `1` to `50` one by one
* Each time an integer is taken out, `count += i` is executed once
* After the loop ends, `count` stores the final total

In this way, we can get the sum of all positive integers within `50`.

Similarly, if we need to calculate the sum of integers from `1` to `100`, we only need to change the range:

```swift
var count = 0
for i in 1...100 {
    count += i
}
print(count)	// 5050
```

A `for` loop can not only loop through arrays, but also loop through a range. This ability to repeatedly process data in order is very common in development.

It can help us automatically handle a lot of repetitive work without manually writing the addition of every number, or other similar repetitive operations.

## Loops in SwiftUI

The earlier `for` loop belongs to the Swift language itself.

However, in SwiftUI, we cannot directly use `for` inside a view structure to generate views:

```swift
VStack {
	for i in 1...100 {	// Error
	    count += i
	}
}
```

This is because what `VStack` needs inside it is SwiftUI views, while a normal `for` loop itself is not a view.

If we want to repeatedly generate UI based on the contents of an array in SwiftUI, we need to use `ForEach`.

For example, if we want to display all the names of members in a group, we can write:

```swift
VStack {
    Text("Sam")
    Text("John")
    Text("Wathon")
    Text("Bob")
}
```

Display result:

![for1](../../Resource/017_for1.png)

Then, add the same modifiers to each `Text`:

```swift
VStack {
    Text("Sam")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("John")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Wathon")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
    Text("Bob")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

Now, each `Text` is displayed with a smaller and bolder font.

Display result:

![](../../Resource/017_for2.png)

Although modifiers make the interface look better, they also make the code longer and more repetitive.

If more names are added, or if we later want to modify the font, color, and other styles in a unified way, we would need to repeatedly write and modify a lot of the same code. This is troublesome and not easy to maintain.

At this point, we can first put these names into an array, then use `ForEach` in SwiftUI to repeatedly generate views based on the data in the array:

```swift
VStack {
    let names = ["Sam", "John", "Wathon", "Bob"]
    ForEach(names, id:\.self) { item in
        Text(item)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundStyle(Color.black)
    }
}
```

This code is more concise. `ForEach` will read each element in the array one by one and display the corresponding content on the screen.

When we later add new names, we only need to modify the names in the `names` array. We do not need to repeatedly add `Text` and complex modifiers each time.

## ForEach

`ForEach` is a structure in SwiftUI used to repeatedly generate views. You can think of it as a structure in SwiftUI that is similar to a `for` loop.

Basic syntax:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

For example, the group names just now:

```swift
let names = ["Sam", "John", "Wathon", "Bob"]
ForEach(names, id:\.self) { item in
    Text(item)
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
}
```

This code means:

`names` is the array being looped through, which is the data to be displayed.

`id:\.self` means using the element itself in the array to distinguish each element.

In the current example, the array stores strings:

```swift
["Sam", "John", "Wathon", "Bob"]
```

So SwiftUI will directly use the strings themselves, such as "Sam", "John", "Wathon", and "Bob", to distinguish different content.

For common simple arrays at the beginner stage, such as `String` and `Int`, we can usually start by writing:

```swift
id: \.self
```

For now, you only need to remember this one form first. There is no need to go deeper into more `id` rules yet.

The `item` in `item in` represents the current element being taken out.

For example, during the first loop, `item` is `"Sam"`, and during the second loop, `item` is `"John"`.

Therefore:

```swift
Text(item)
```

will become, one by one:

```swift
Text("Sam")
Text("John")
Text("Wathon")
Text("Bob")
```

So, the function of this code is: take each name out of the `names` array one by one, and generate a `Text` view for each name.

### Execution Process

The execution process can be understood as:

* `ForEach` first reads the first element `"Sam"` in the `names` array
* `item` temporarily represents `"Sam"`
* `Text(item)` displays `"Sam"`
* Then it continues to read the next element `"John"`
* Then it repeats the same view code again

Finally, all names in the array will be displayed.

The benefit of writing it this way is: when there are more names, we do not need to repeatedly write many `Text` views. We only need to modify the contents of the array.

### Looping Through Photos

`ForEach` can not only display text, but also display images, colors, or other SwiftUI views.

For example, we prepare 4 images:

```
430F9BEF.jpeg
193E0C8C.jpeg
FEE2AB8D.jpeg
35AA4D15.jpeg
```

Drag these four images into the Assets folder in Xcode.

![image](../../Resource/017_for3.png)

If we do not use `ForEach`, we need to write each image manually:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Image("430F9BEF")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("193E0C8C")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("FEE2AB8D")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Image("35AA4D15")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
    }
}
```

Display result:

![image](../../Resource/017_for4.png)

Although this approach can achieve the function, the code will be relatively long.

If there are more and more images, we will need to repeatedly write more and more `Image` code.

If we later want to uniformly change the image size, we also need to modify them one by one.

At this point, we can put the image names into an array, then use `ForEach` to repeatedly generate image views:

```swift
VStack {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

Here, `images` is a string array, and each element in the array is an image name.

`ForEach(images, id: \.self)` means reading each element in the `images` array one by one, using the element itself to distinguish each item, and then generating the corresponding view based on the current element.

For example, the first element read is `"430F9BEF"`, so:

```swift
Image(item)
```

is equivalent to:

```swift
Image("430F9BEF")
```

The later images will also be displayed one by one in the same way.

![image](../../Resource/017_for4.png)

Here we still use:

```swift
id: \.self
```

The reason is the same as before: because the elements in the `images` array are also simple string types, at the beginner stage we can directly use the element itself as the way to distinguish each item.

You can simply understand it as a fixed formula:

**When `ForEach` loops through a simple array such as `String` or `Int`, it is common to write `id: \.self`.**

### Adding More Images

If we need to add more images later, we only need to modify the array contents:

```
let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15","430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
```

There is no need to repeatedly write new `Image` code again.

If there are many images, you can use it together with `ScrollView`. Otherwise, once the content exceeds the screen, you will not be able to preview it completely.

```swift
ScrollView {
    let images = ["430F9BEF","193E0C8C","FEE2AB8D","35AA4D15"]
    ForEach(images, id: \.self) {
        item in
        Image(item)
            .resizable()
            .scaledToFit()
            .frame(width: 200)
    }
}
```

### Modifying Images

When we need to modify the image style in a unified way, we only need to modify the code inside `ForEach`.

For example, change the width to `80`:

```swift
ForEach(images, id: \.self) {  item in
    Image(item)
        .resizable()
        .scaledToFit()
        .frame(width: 80)
}
```

In this way, all images will be modified together, and we do not need to change them one by one.

This is one important role of `ForEach`:

**When multiple views have the same structure and only the content is different, you can write the view code once and let the data in the array decide what is displayed.**

## Summary

In this lesson, we learned about the `for` loop and `ForEach`.

A `for` loop is used to process elements in an array or range in order, and is more inclined toward data processing.

`ForEach` is used in SwiftUI to repeatedly generate views based on the contents of an array, and is more focused on view display.

At the current beginner stage, the most common form of `ForEach` is:

```swift
ForEach(array, id: \.self) { element in
    SwiftUI code
}
```

Here, `id: \.self` means using the element itself to distinguish each element.

When the contents of the array are simple types such as `String` and `Int`, we can usually start by using this one form.

Later, when browsing websites or apps, if you see a group of repeated text, images, or other list content, you can think that in SwiftUI, this content is usually first placed into an array, and then displayed one by one through `ForEach`.
