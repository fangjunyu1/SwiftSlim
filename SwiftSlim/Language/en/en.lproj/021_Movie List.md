# Movie List

In this lesson, we will create a movie list.

![movie](../../Resource/021_movie.png)

The list will display each movie's poster, name, director, and rating.

In this example, we will learn a very important concept: the `struct` structure. It can help us combine multiple pieces of information about a movie into one whole. In addition, we will also work with `UUID()`, `ForEach`, the `Divider` separator, and how to use custom objects to manage data.

These ideas are very common in later SwiftUI development. After finishing this lesson, you will not only be able to build a movie list, but also start to understand "how to display a set of data as an interface."

## Single Movie

We can start by building the interface for a single movie.

![movie](../../Resource/021_movie1.png)

The layout of this interface mainly consists of two parts: the movie poster on the left and the movie introduction on the right.

### Movie Poster

The left side shows the movie poster, and we can use `Image` to display the image.

For example:

```swift
Image("The Shawshank Redemption")
    .resizable()
    .scaledToFit()
    .frame(height: 180)
    .cornerRadius(10)
```

This code means that an image named `"The Shawshank Redemption"` is displayed.

One thing to note here is that the image name must actually exist in the `Assets` resource folder. Otherwise, the interface will not be able to display this image correctly.

![movie](../../Resource/021_movie2.png)

The functions of these modifiers are:

- `resizable()` means the image can be resized.
- `scaledToFit()` means the original aspect ratio is kept during scaling so the image does not get stretched or distorted.
- `frame(height: 180)` means the image height is set to 180.
- `cornerRadius(10)` means the image gets rounded corners with a radius of 10.

This way, we can get a movie poster image with a suitable size and rounded corners.

![movie](../../Resource/021_movie3.png)

### Movie Introduction

The right side shows the movie introduction, including the movie name, director, and rating.

![movie](../../Resource/021_movie4.png)

We can use `Text` to display this part:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)
	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}
	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

In this code, `.font` represents the font size, and `.fontWeight` represents the font weight.

To make the spacing between the "movie name," "director information," and "rating information" clearer, we use `VStack` on the outermost level here and set:

```swift
spacing: 10
```

This means the spacing between each group of content inside this `VStack` is 10.

The reason the director and rating each use another `VStack` is that they both belong to a "title + content" structure. Because of this, the interface hierarchy becomes clearer, and it is also more convenient for us to continue adjusting the style later.

In addition, `VStack` is centered by default. To align all the text to the left, we set:

```swift
alignment: .leading
```

This makes the movie introduction section look cleaner.

### Divider

Now, although the content in the movie introduction has been spaced apart using `spacing`, the boundaries between different pieces of content are still not obvious enough.

At this point, we can add a divider:

```swift
Divider()
```

For example:

```swift
VStack(alignment: .leading,spacing: 10) {
	Text("The Shawshank Redemption")
	    .font(.title3)
	    .fontWeight(.bold)

	Divider()

	VStack(alignment: .leading) {
		Text("director")
		    .fontWeight(.bold)
		Text("Frank Darabont")
	}

	Divider()

	VStack(alignment: .leading) {
		Text("rating")
		    .fontWeight(.bold)
		Text("9.3 / 10")
	}
}
```

This gives the movie introduction section a more obvious separation effect.

![movie](../../Resource/021_movie4.png)

`Divider` is a very simple but commonly used view whose role is to separate different content.

In `VStack`, `Divider()` is displayed as a horizontal line.

In `HStack`, `Divider()` is displayed as a vertical line.

In addition, we can also modify the style of `Divider` through methods such as `.frame`, `.background`, and `.padding`.

For example:

```swift
Divider()
    .frame(height: 2)
    .background(Color.blue)
    .padding(.horizontal)
```

This creates a blue divider line with a thickness of 2 and horizontal padding on both sides.

![divider](../../Resource/021_divider.png)

### Complete Interface

Finally, we can use `HStack` to arrange the movie poster and the movie introduction side by side.

```swift
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
    	.scaledToFit()
    	.frame(height: 180)
    	.cornerRadius(10)
	VStack(alignment: .leading,spacing: 10) {
		Text("The Shawshank Redemption")
		    .font(.title3)
		    .fontWeight(.bold)

		Divider()

		VStack(alignment: .leading) {
			Text("director")
			    .fontWeight(.bold)
			Text("Frank Darabont")
		}

		Divider()

		VStack(alignment: .leading) {
			Text("rating")
			    .fontWeight(.bold)
			Text("9.3 / 10")
		}
	}
	.frame(width: 200)
}
```

Here, `HStack(spacing: 20)` means there is a spacing of 20 between the left and right sections.

It is important to note that `Divider()`, like the `TextField` and `Slider` we discussed earlier, tries to occupy as much available space as possible by default.

Therefore, we set a fixed width for the outer `VStack` of the introduction section on the right:

```swift
.frame(width: 200)
```

This keeps the width of the divider line and the text area consistent, making the overall layout look cleaner.

At this point, we have completed the display interface for a "single movie."

![movie](../../Resource/021_movie1.png)

## Store Movies in an Array

If we want to display multiple movies one after another in the same style, that means we would need to write similar code for every movie.

For example:

```swift
// The Shawshank Redemption
HStack(spacing: 20) {
	Image("The Shawshank Redemption")
    	.resizable()
		...
}
// Forrest Gump
HStack(spacing: 20) {
	Image("Forrest Gump")
    	.resizable()
		...
}
// 3 Idiots
HStack(spacing: 20) {
	Image("3 Idiots")
    	.resizable()
		...
}
// ...
```

Although code written this way can achieve the result, the code will become longer and longer, and it will be very troublesome to maintain.

For example, if we need to change the spacing for all movies from `20` to `15`, or change the width on the right side from `200` to
`220`, we would need to manually edit every repeated block of code.

This is obviously not an efficient method.

We previously learned arrays, and we also learned to use `ForEach` to repeatedly display views based on an array.

For example:

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

This approach is very suitable for handling cases where there is "only one piece of data," such as a group of image names.

However, a movie does not have only one value. It contains at least:

1. the movie poster
2. the movie name
3. the director
4. the rating

In other words, a movie is actually a set of related data, not just a single string.

If we only use arrays, we can only store this information separately:

```swift
let movieName = ["The Shawshank Redemption", "Forrest Gump", "3 Idiots", "The Pursuit of Happyness", "Dead Poets Society"]
let movieDirector = ["Frank Darabont", "Robert Zemeckis", "Rajkumar Hirani", "Gabriele Muccino", "Peter Weir"]
let movieRating = ["9.3 / 10", "8.8 / 10", "8.4 / 10", "8.0 / 10", "8.1 / 10"]
```

When displaying them, we have to rely on the same index to match them one by one:

```swift
Text(movieName[0])
    .font(.title3)
    .fontWeight(.bold)

Divider()

VStack(alignment: .leading) {
	Text("director")
	    .fontWeight(.bold)
	Text(movieDirector[0])
}
```

The problem with this approach is that the maintenance cost is very high.

Because the data for a movie is split across multiple arrays, as soon as one array has one extra item, one missing item, or a different order, the display result will be wrong.

Especially when adding or removing movies, you must update multiple arrays at the same time, and it is very easy to miss something.

So how can we combine information such as "movie name, director, and rating" into one whole?

This requires using `struct`.

## Define a struct Structure

In Swift, `struct` means "structure."

You can think of it as a "custom data type" that can combine multiple related fields into one whole.

Basic usage:

```swift
struct StructName {
	let name: String
}
```

In this code, `struct` is the keyword that indicates we are defining a structure. `StructName` is the name of the structure.

The content inside the braces is the set of fields contained in this structure, and each field must clearly include both a name and a type.

Normally, the name of a `struct` starts with a capital letter, such as `Movie`, `Student`, or `UserInfo`. This is a common naming convention in Swift.

You can simply think of `struct` as an empty box, where each field is like a reserved empty position inside the box.

When these positions have not been filled yet, it is just an empty box. Only after all the fields are filled with suitable values does it become a complete gift box.

### struct Instance

Earlier, we only defined the structure itself, which is equivalent to preparing the shape of the box.

We still need to fill in the actual content to get a real "instance" that can be used.

When creating an instance, we usually add `()` after the structure name:

```swift
StructName(...)
```

What is filled in the parentheses is the field content required by this structure.

For example:

```swift
StructName(name: "Fang Junyu")
```

This code means: create a new instance according to the format of the `StructName` structure, and assign the value `"Fang Junyu"` to the `name` field.

When we fill in all the required field values, it is like filling up the box.

At that point, we get a complete structure instance.

### Access struct Properties

After creating an instance, we can use dot syntax to access the properties inside it.

Basic syntax:

```swift
instance.propertyName
```

For example:

```swift
let st = StructName(name: "Fang Junyu")
st.name    // "Fang Junyu"
```

Here, `st` is a structure instance, and `st.name` means reading the `name` value from that instance.

You can understand this reading method like this: when we write `st.name`, it is like reading the content stored in a certain position inside that box.

This style of writing will be very common in later SwiftUI interfaces.

For example, if we have a student structure that includes name, age, and class, then when displaying it in the interface, we can read:

```swift
student.name
student.age
student.className
```

The advantage of doing this is that the data becomes clearer and easier to manage.

### struct Position

For beginners, the structure can usually be written outside `ContentView`.

For example:

```swift
import SwiftUI

struct StructName {
	let name: String
}

struct ContentView: View {
	// ...
}
```

This makes the structure clearer and easier to read.

You will notice that `ContentView` itself is actually also a `struct`.

### Movie Structure

With the foundation above, we can define a movie structure:

```swift
struct Movie {
    let name: String
    let director: String
    let rating: String
}
```

This is a structure named `Movie`, consisting of the three fields `name`, `director`, and `rating`, which represent the movie name, director, and rating.

This way, the information related to a movie no longer needs to be split into multiple arrays, but can instead be directly combined into one whole.

For example, we can create a movie instance like this:

```swift
Movie(name: "The Shawshank Redemption",
      director: "Frank Darabont",
      rating: "9.3 / 10"
	  )
```

This instance represents "one complete set of movie data."

### Store Structures in an Array

Earlier, we said that an array can store only one type.

Now that we already have the `Movie` structure, the array can store multiple `Movie` values.

```swift
let lists: [Movie] = []
```

For example:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
	Movie(name: "Forrest Gump",
        director: "Robert Zemeckis",
        rating: "8.8 / 10"),
	Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
	Movie(name: "The Pursuit of Happyness",
        director: "Gabriele Muccino",
        rating: "8.0 / 10"),
	Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

In this `lists` array, what is stored is not strings, but multiple `Movie` instances.

That is, each element in the array is one complete movie.

This way, when we need to display the movie list, we can use `ForEach` to read each movie one by one.

```swift
ForEach(lists, id: \.self) { movie in
    HStack(spacing: 20) {
        Image(movie.name)
            .resizable()
            .scaledToFit()
            .frame(height: 180)
            .cornerRadius(10)
        
        VStack(alignment: .leading,spacing: 10) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.bold)
            Divider()
            VStack(alignment: .leading) {
                Text("director")
                    .fontWeight(.bold)
                Text(movie.director)
            }
            Divider()
            VStack(alignment: .leading) {
                Text("rating")
                    .fontWeight(.bold)
                Text(movie.rating)
            }
        }
        .frame(width: 200)
    }
}
```

Here, `movie in` means that in each loop, one movie is taken from the array and temporarily named `movie`.

Then, we can use:

```swift
movie.name
movie.director
movie.rating
```

to read that movie's name, director, and rating respectively, and display them in the interface.

## ForEach Error

At this point, we have already completed the basic writing style for the movie array and `ForEach`.

However, if you directly run the following code:

```swift
ForEach(lists,id: \.self) { movie in
	// ...
}
```

you will get an error:

```swift
Generic struct 'ForEach' requires that 'Movie' conform to 'Hashable'
```

The meaning of this error is that when you write `id: \.self`, SwiftUI needs to treat each element in the array itself as a "unique identifier" in order to distinguish them.

This writing style is suitable for simple types like `String` and `Int`, because they are easier to distinguish by themselves.

But `Movie` is a custom structure we defined ourselves, and `ForEach` does not know how to treat the structure itself as a unique identifier, so it reports an error.

The most common way to solve this problem is to make `Movie` conform to the `Identifiable` protocol.

## Protocol

In Swift, a protocol can be understood as a kind of "rule" or "requirement."

You can think of it like an agreement in an international organization: if a country wants to join a certain international organization, it usually first needs to satisfy some rules proposed by that organization, disclose some data, and follow some common rules. Only after meeting those conditions can it join or participate in certain affairs.

Protocols work in a similar way.

When a type wants to conform to a certain protocol, it needs to satisfy the content required by that protocol. Only after meeting those requirements can that type use the corresponding functionality.

Basic syntax:

```swift
struct Movie: Identifiable {
    // ...
}
```

Here, `: Identifiable` means that `Movie` conforms to the `Identifiable` protocol.

If a type conforms to multiple protocols, they can be separated with commas:

```swift
struct Movie: Identifiable, Codable {
    // ...
}
```

For `Identifiable`, the most important requirement is that the type needs an `id` that can identify itself.

For example:

```swift
struct Movie: Identifiable {
    let id: Int
    let name: String
    let director: String
    let rating: String
}
```

Here, `id` is like an ID number and is used to distinguish each movie.

As long as each movie's `id` is different, SwiftUI can correctly distinguish each element in the array.

For example:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 2,
          name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(id: 3,
          name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(id: 4,
          name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(id: 5,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Then use the following in `ForEach`:

```swift
ForEach(lists, id: \.id) { movie in
    // ...
}
```

This way, there will be no error.

Because `Movie` already conforms to `Identifiable`, a more common writing style is to omit `id:` directly:

```swift
ForEach(lists) { movie in
    // ...
}
```

Because SwiftUI already knows to use `movie.id` to distinguish each item.

## The Distinguishing Identifier in ForEach

Next, we will understand the role of `id` in `ForEach` more deeply.

For example:

```swift
ForEach(lists, id: \.self)
```

This means: use the element itself as the distinguishing identifier.

And:

```swift
ForEach(lists, id: \.id)
```

means: use the element's `id` field as the distinguishing identifier.

If a certain field can guarantee uniqueness by itself, it can also be used temporarily.

For example, if each movie has a different name, then the following code may also work correctly with the current data:

```swift
ForEach(lists, id: \.name)
```

But there is a hidden problem here: `name` is not guaranteed to always be unique.

Suppose that later you add another movie with the same name. Then `name` can no longer accurately distinguish every element.

At that point, even though the code may still compile, SwiftUI may recognize elements incorrectly during view refreshes, updates, insertions, or deletions, causing display issues.

Therefore, when we need stable data distinction, it is still best to use the truly unique field, which is `id`.

## UUID

Although manually writing `id: 1`, `id: 2` can solve the problem, there is still one risk: you may accidentally write duplicate `id` values, and then the unique identifier becomes invalid.

For example:

```swift
let lists: [Movie] = [
    Movie(id: 1,
          name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(id: 1,
          name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

This results in two identical `id` values, and the unique identifier loses its effect.

To avoid manual mistakes, we usually use `UUID()`.

In Swift, `UUID()` randomly generates a 128-bit identifier. It is usually displayed as a long string made up of letters and numbers.

For example:

```swift
let uuid = UUID()    // "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
```

Here, `UUID()` actually creates an instance of the `UUID` type. You can think of it as an automatically generated "unique number."

Because of this, the values created each time are almost never repeated, so they are very suitable for use as `id`.

We can modify `Movie` like this:

```swift
struct Movie: Identifiable {
    let id = UUID()
    let name: String
    let director: String
    let rating: String
}
```

This code means that the `id` field in the `Movie` structure will be assigned a new `UUID` instance by default.

In other words, every time we create a new `Movie`, the system will automatically generate a unique `id` first.

Since `id` already has a default value, we no longer need to manually fill in `id` when creating `Movie` instances later.

For example:

```swift
let lists: [Movie] = [
    Movie(name: "The Shawshank Redemption",
          director: "Frank Darabont",
          rating: "9.3 / 10"),
    Movie(name: "Forrest Gump",
          director: "Robert Zemeckis",
          rating: "8.8 / 10"),
    Movie(name: "3 Idiots",
          director: "Rajkumar Hirani",
          rating: "8.4 / 10"),
    Movie(name: "The Pursuit of Happyness",
          director: "Gabriele Muccino",
          rating: "8.0 / 10"),
    Movie(name: "Dead Poets Society",
          director: "Peter Weir",
          rating: "8.1 / 10")
]
```

Although `id` is not written here, the movie instance still has its own `id`; it is just that this value has already been automatically generated by `UUID()`.

After using this method, we no longer need to manually fill in `id` for every movie, which not only reduces the amount of code, but also avoids errors caused by duplicate id values.

Finally, we only need to add a `Banner` image at the top and use `ScrollView` so the content can scroll, and then the entire movie list view is complete.

## Summary

In this lesson, we learned a very important concept: `struct`.

Through `struct`, we can combine multiple related fields of a movie into one whole, instead of splitting the name, director, and rating into multiple arrays.

After the data is combined, we can use `ForEach` to display each movie in the array one by one in the view.

At the same time, we also understood the role of the "distinguishing identifier" in `ForEach`: SwiftUI must know how to distinguish each element in the array in order to display and update the view correctly.

Therefore, we made `Movie` conform to the `Identifiable` protocol and provided it with a unique `id`.

To avoid mistakes when manually filling in `id`, we further learned `UUID()` so the system can automatically generate the unique identifier.

After finishing this lesson, you will not only complete the movie list, but also begin to touch on an important idea in SwiftUI: **organize the data first, then generate the view based on the data.**

## Complete Code

```swift
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    let name: String
    let director: String
    let rating: String
}

struct ContentView: View {
    let lists: [Movie] = [
        Movie(name: "The Shawshank Redemption",
              director: "Frank Darabont",
              rating: "9.3 / 10"),
        Movie(name: "Forrest Gump",
              director: "Robert Zemeckis",
              rating: "8.8 / 10"),
        Movie(name: "3 Idiots",
              director: "Rajkumar Hirani",
              rating: "8.4 / 10"),
        Movie(name: "The Pursuit of Happyness",
              director: "Gabriele Muccino",
              rating: "8.0 / 10"),
        Movie(name: "Dead Poets Society",
              director: "Peter Weir",
              rating: "8.1 / 10")
    ]
    var body: some View {
        ScrollView {
            VStack(spacing:50) {
                Image("banner")
                    .resizable()
                    .scaledToFit()
                ForEach(lists) { movie in
                    HStack(spacing: 20) {
                        Image(movie.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 10) {
                            Text(movie.name)
                                .font(.title3)
                                .fontWeight(.bold)

                            Divider()

                            VStack(alignment: .leading) {
                                Text("director")
                                    .fontWeight(.bold)
                                Text(movie.director)
                            }

                            Divider()

                            VStack(alignment: .leading) {
                                Text("rating")
                                    .fontWeight(.bold)
                                Text(movie.rating)
                            }
                        }
                        .frame(width: 200)
                    }
                }
            }
        }
    }
}
```
