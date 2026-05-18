# Animal Encyclopedia

In this lesson, we will continue practicing custom views and data passing.

We will create a simple animal encyclopedia view. The page will display five animals. When you tap an animal, a detail view will appear, showing the animal’s image, distribution area, habitat, and description.

Final result:

![view](../../../Resource/029_view.png)

Through this case, we can practice how data structures, list display, tap interaction, and sheet presentation work together.

## Prepare Image Assets

First, we need to prepare five animal images:

- Dolphin: `dolphin.jpg`
- Giraffe: `giraffe.jpg`
- Lion: `lion.jpg`
- Panda: `panda.jpg`
- Polar bear: `polarBear.jpg`

You can use the following image assets:

[Dolphin](https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Tursiops_truncatus_01.jpg/960px-Tursiops_truncatus_01.jpg), [Giraffe](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/500px-Giraffe_Mikumi_National_Park.jpg), [Lion](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/960px-Lion_waiting_in_Namibia.jpg), [Panda](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Giant_Panda_at_Singapore_River_Safari.jpg/500px-Giant_Panda_at_Singapore_River_Safari.jpg), [Polar Bear](https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Polar_Bear_2004-11-15.jpg/500px-Polar_Bear_2004-11-15.jpg)

After downloading the images, drag them into the `Assets` resource folder of the Xcode project.

![assets](../../../Resource/029_assets.png)

Note that when using images in code, you usually do not need to write the `.jpg` extension.

For example, if the image asset name is `dolphin`, write this in the code:

```swift
Image("dolphin")
```

If the image name is written incorrectly, the image will not display properly.

Note: The image assets above come from Wikimedia projects. When using them, it is recommended to keep the original links and source information.

## Create the Animal Structure

On this page, each animal has several pieces of information:

- Animal name
- Animal image
- Animal emoji
- Distribution area
- Habitat
- Animal description

If we split this information into many separate variables, the code will become messy. Therefore, we can create an `Animal` structure and keep the information for one animal together.

```swift
struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let avatarEmoji: String
    let distributionArea: String
    let habitat: String
    let animalDescription: String
}
```

In this code:

- `id`: the unique identifier of the animal.
- `name`: the animal name.
- `imageName`: the animal image name.
- `avatarEmoji`: the animal emoji.
- `distributionArea`: the distribution area.
- `habitat`: the habitat.
- `animalDescription`: the animal description.

Among them:

```swift
let id = UUID()
```

`id` is used to identify each animal. Later, we will use `ForEach` to display the animal list and use `.sheet(item:)` to present details based on the selected animal, so `Animal` needs to conform to the `Identifiable` protocol.

The role of `Identifiable` is to tell SwiftUI that each animal has an `id` that can distinguish its identity.

## Create Animal Data

Next, we create an animal array in `ContentView`.

The array stores five `Animal` values, and each `Animal` represents one animal.

```swift
struct ContentView: View {
    let animals: [Animal] = [
        // Dolphin
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // Giraffe
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // Lion
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // Polar Bear
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]

    var body: some View {
        Text("Animal Encyclopedia")
    }
}
```

Here, `animals` is an array:

```swift
let animals: [Animal]
```

`[Animal]` means this array stores multiple `Animal` values.

In other words, `animals` is not one animal, but a group of animals.

## Display the Animal List

Now we can use `ForEach` to display the animal list.

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            HStack(spacing: 10) {
                Text(animal.avatarEmoji)
                    .font(.title2)
                    .frame(width: 40, height: 40)
					.background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Text(animal.name)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(15)
            .frame(width: 200, height: 60)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
    }
}
```

Display result:

![view](../../../Resource/029_view1.png)

In this code:

```swift
ForEach(animals) { animal in
    ...
}
```

This means traversing the `animals` array.

In each loop, `animal` represents the animal currently being displayed.

For example, in the first loop, `animal` is the dolphin; in the second loop, `animal` is the giraffe.

Therefore, we can display the current animal’s information in the following way:

```swift
Text(animal.avatarEmoji)
Text(animal.name)
```

This displays all five animals.

## Make the Animal List Tappable

The list is now displayed, but it cannot be tapped yet.

If we want to present details after tapping an animal, we first need to record the “currently selected animal”.

Therefore, add a state variable in `ContentView`:

```swift
@State private var selectedAnimal: Animal? = nil
```

Here, `selectedAnimal` is an optional value of type `Animal?`.

This means it may contain an animal, or it may contain no animal.

The default value is `nil`, which means no animal is selected at the beginning.

Then, we change each animal row into a `Button`:

```swift
ForEach(animals) { animal in
    Button(action: {
        selectedAnimal = animal
    }, label: {
        HStack(spacing: 10) {
            Text(animal.avatarEmoji)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
            
            Text(animal.name)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(15)
        .frame(width: 200,height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
}
```

The key line is this:

```swift
selectedAnimal = animal
```

When the user taps an animal, we save that animal into `selectedAnimal`.

For example, if the user taps the dolphin, `selectedAnimal` stores the dolphin.

If the user taps the panda, `selectedAnimal` stores the panda.

In other words, `selectedAnimal` records which animal the user has just tapped.

## Present a Sheet View

Now we can use the button to record the “currently tapped animal”.

Next, we need to implement a presented view to display the animal details.

![view](../../../Resource/029_view2.png)

In SwiftUI, we can use `Sheet` to implement this presentation effect.

A `Sheet` can be understood as a temporarily presented page. It appears above the current page, and after viewing the content, the user can swipe down to dismiss it.

## Sheet Example

Before displaying the animal details, let’s use a simple example to understand how a `Sheet` is presented.

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Show Sheet")
                .font(.system(size: 50))
        })
        .sheet(isPresented: $showSheet) {
            Text("Sheet View")
                .font(.system(size: 50))
                .fontWeight(.bold)
        }
    }
}
```

Display result:

![view](../../../Resource/029_view3.png)

In this code, we create a Boolean value:

```swift
@State private var showSheet = false
```

`showSheet` is `false` by default, which means the `Sheet` is not displayed at the beginning.

When the button is tapped:

```swift
showSheet.toggle()
```

`toggle()` means switching the Boolean value.

If it was originally `false`, it becomes `true` after calling `toggle()`.

If it was originally `true`, it becomes `false` after calling `toggle()`.

So after tapping the button, `showSheet` changes from `false` to `true`.

When `showSheet` becomes `true`, the following code presents the `Sheet`:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

This code means: when `showSheet` is `true`, present a `Sheet` and display `Text("Sheet View")` inside the `Sheet`.

Display result:

![view](../../../Resource/029_view4.png)

This style is suitable for presenting fixed content.

For example, after tapping a button, it can present a settings page, instruction page, prompt page, and so on.

### Where to Place Sheet

Although `Sheet` is a presented view, in SwiftUI it is not written directly as an independent view like `Text()` or `Image()`. Instead, it is used as a view modifier.

That is, `.sheet(...)` is similar to modifiers such as `.font()`, `.padding()`, and `.shadow()`. It needs to be attached after a view.

For example:

```swift
Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

In this example, `.sheet` is attached after the `Button`.

When `showSheet` becomes `true`, SwiftUI presents the `Sheet` and displays the content inside the braces:

```swift
Text("Sheet View")
```

However, in real development, if a page has multiple buttons, we usually do not add a `.sheet` to every button.

A more common approach is to attach `.sheet` after the outer view.

For example:

```swift
VStack {
    Button("Show Sheet") {
        showSheet.toggle()
    }
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

The button is responsible for changing `showSheet`, and the outer view is responsible for presenting the `Sheet` based on whether `showSheet` is `true`.

## Bind Sheet to an Optional Value

The style we learned earlier was:

```swift
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

This style is suitable for controlling the display and hiding of a fixed page.

However, in the animal encyclopedia case, we need to know not only “whether to present the `Sheet`”, but also “which animal was tapped”.

For example:

If the user taps the dolphin, the `Sheet` should display the dolphin details.

If the user taps the panda, the `Sheet` should display the panda details.

So here, another sheet style is more suitable:

```swift
.sheet(item: $selectedAnimal) { animal in
    // Content displayed in the sheet
}
```

In this code, `Sheet` is bound to an optional value, `selectedAnimal`.

Note that after `item:`, we write `$selectedAnimal`, not `selectedAnimal`.

This is because `Sheet` does not only read the value of `selectedAnimal`; it also needs to decide whether to present based on its changes.

You can understand this code this way:

- When `selectedAnimal` is `nil`, the `Sheet` is not displayed.
- When `selectedAnimal` has a value, the `Sheet` is displayed.
- When the `Sheet` is dismissed, SwiftUI changes `selectedAnimal` back to `nil`.

SwiftUI passes the animal stored in `selectedAnimal` to the `animal` inside the braces.

In other words, `.sheet(item:)` not only controls presentation, but also passes the selected data into the `Sheet`.

## Use Sheet to Display the Animal Name

Now, do not rush to create a complex detail view yet.

To make the code easier to understand, let’s first display the current animal’s name in the `Sheet`.

Add `.sheet(item:)` outside the `VStack`:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        Text(animal.name)
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}
```

The most important part here is this code:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

When `selectedAnimal` has a value, the `Sheet` is presented.

The `animal` inside the braces is the currently selected animal.

Therefore:

```swift
Text(animal.name)
```

This displays the name of the currently tapped animal.

For example, tap `Dolphin`, and the Sheet displays `Dolphin`.

Tap `Panda`, and the `Sheet` displays `Panda`.

In this way, we have implemented the effect of tapping different animals and presenting different animal names.

Display the animal name:

![view](../../../Resource/029_view5.png)

However, animal details should not display only a name. They should also display the name, distribution area, habitat, and description.

If we write all this code inside `.sheet`, the code will become very long and difficult to read.

So next, we create a new custom view specifically responsible for displaying animal details.

## Create the Animal Detail View

Next, we create a new custom view named `AnimalDetailView`.

This view receives an `Animal` and displays the animal details.

```swift
struct AnimalDetailView: View {
    var animal: Animal

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)

                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 12) {
                    Text("**Distribution Area**: \(animal.distributionArea)")

                    Divider()

                    Text("**Habitat**: \(animal.habitat)")

                    Divider()

                    Text("**Animal Description**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}
```

Display result:

![view](../../../Resource/029_view2.png)

The key point here is:

```swift
var animal: Animal
```

This means `AnimalDetailView` needs to receive an animal from the outside.

After receiving the animal, the detail view can use the animal’s various pieces of information:

```swift
animal.imageName
animal.name
animal.distributionArea
animal.habitat
animal.animalDescription
```

In other words, `AnimalDetailView` is only responsible for displaying the animal passed into it.

### Markdown Bold Text

In the detail view, we wrote code like this:

```swift
Text("**Habitat:** \(animal.habitat)")
```

There are two points to understand here.

First, `**Habitat:**` uses `Markdown` syntax. Text wrapped in two asterisks will be displayed in bold.

Second, `\()` is string interpolation, which can display the value of a variable inside text.

This code first displays the bold `Habitat:`, and then displays the animal’s habitat.

## Display the Detail View in the Sheet

After creating `AnimalDetailView`, we can return to `ContentView` and replace the original name view in the `Sheet` with the detail view.

Originally, it was:

```swift
.sheet(item: $selectedAnimal) { animal in
    Text(animal.name)
        .font(.system(size: 50))
        .fontWeight(.bold)
}
```

Now change it to:

```swift
.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

Here, `animal:` is the parameter name of `AnimalDetailView`.

The `animal` after it is the current animal passed in by `.sheet(item:)`.

That is, pass the currently tapped animal to `AnimalDetailView` for display.

Complete structure:

```swift
var body: some View {
    VStack(alignment: .leading, spacing: 20) {
        ForEach(animals) { animal in
            Button(action: {
                selectedAnimal = animal
            }, label: {
                HStack(spacing: 10) {
                    Text(animal.avatarEmoji)
                        .font(.title2)
                        .frame(width: 40, height: 40)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(animal.name)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(15)
                .frame(width: 200, height: 60)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
            })
            .buttonStyle(.plain)
        }
    }
    .padding()
    .sheet(item: $selectedAnimal) { animal in
        AnimalDetailView(animal: animal)
    }
}
```

When the user taps an animal:

```swift
selectedAnimal = animal
```

`selectedAnimal` changes from `nil` to a specific animal. After the `Sheet` detects that `selectedAnimal` has a value, it presents the view.

The `Sheet` passes the animal in `selectedAnimal` to the `AnimalDetailView` view, and `AnimalDetailView` displays the animal details.

In this way, we have implemented the feature of tapping the animal list and presenting the corresponding animal details.

## Differences Between the Two Sheet Styles

Now we have used `.sheet(item:)` to complete the display of the animal detail view.

Here, we can briefly summarize the two common styles of `Sheet`.

### The First Style Is Binding a Boolean Value

```swift
@State private var showSheet = false

Button("Show Sheet") {
    showSheet.toggle()
}
.sheet(isPresented: $showSheet) {
    Text("Sheet View")
}
```

This style is suitable for presenting fixed content, such as a settings page, instruction page, prompt page, and so on.

`showSheet` is a Boolean value with only two states: `true` and `false`.

When `showSheet` is `true`, the `Sheet` is displayed.

When `showSheet` is `false`, the `Sheet` is not displayed.

### The Second Style Is Binding an Optional Value

```swift
@State private var selectedAnimal: Animal? = nil

.sheet(item: $selectedAnimal) { animal in
    AnimalDetailView(animal: animal)
}
```

This style is suitable for presenting different content based on the selected data.

In this lesson, we tap different animals and need to display different animal details, so using `.sheet(item:)` is more suitable.

## Complete Code

```swift
import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    // Animal name
    let name: String
    
    // Animal image
    let imageName: String
    
    // Animal emoji
    let avatarEmoji: String
    
    // Distribution area
    let distributionArea: String
    
    // Habitat
    let habitat: String
    
    // Animal description
    let animalDescription: String
}

struct ContentView: View {
    @State private var selectedAnimal: Animal? = nil
    
    let animals: [Animal] = [
        // Dolphin
        Animal(
            name: "Dolphin",
            imageName: "dolphin",
            avatarEmoji: "🐬",
            distributionArea: "Warm and temperate oceans around the world.",
            habitat: "Oceans, coastal waters, and some large rivers.",
            animalDescription: "Dolphins are intelligent marine mammals. They live in groups, communicate with sounds, and are known for their playful behavior."
        ),
        // Giraffe
        Animal(
            name: "Giraffe",
            imageName: "giraffe",
            avatarEmoji: "🦒",
            distributionArea: "Savannas and open woodlands in Africa.",
            habitat: "Grasslands, savannas, and open forests.",
            animalDescription: "Giraffes are the tallest land animals. They have long necks, long legs, and usually feed on leaves from tall trees."
        ),
        // Lion
        Animal(
            name: "Lion",
            imageName: "lion",
            avatarEmoji: "🦁",
            distributionArea: "Mainly found in sub-Saharan Africa, with a small population in western India.",
            habitat: "Grasslands, savannas, and open woodlands.",
            animalDescription: "Lions are powerful big cats. They usually live in groups called prides and are often known as the kings of the animal world."
        ),
        // Panda
        Animal(
            name: "Panda",
            imageName: "panda",
            avatarEmoji: "🐼",
            distributionArea: "Mountain forests in central China.",
            habitat: "Bamboo forests in cool and wet mountain areas.",
            animalDescription: "Pandas are bears known for their black-and-white fur. They mainly eat bamboo and are one of the most recognizable animals in the world."
        ),
        // Polar Bear
        Animal(
            name: "Polar Bear",
            imageName: "polarBear",
            avatarEmoji: "🐻‍❄️",
            distributionArea: "Arctic regions around the North Pole.",
            habitat: "Sea ice, coastal areas, and cold Arctic environments.",
            animalDescription: "Polar bears are large bears adapted to cold environments. They are strong swimmers and mainly depend on sea ice to hunt seals."
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(animals) { animal in
                Button(action: {
                    selectedAnimal = animal
                }, label: {
                    HStack(spacing: 10) {
                        Text(animal.avatarEmoji)
                            .font(.title2)
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(20)

                        Text(animal.name)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .padding(15)
                    .frame(width: 200, height: 60)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                })
                .buttonStyle(.plain)
            }
        }
        .padding()
        .sheet(item: $selectedAnimal) { animal in
            AnimalDetailView(animal: animal)
        }
    }
}

struct AnimalDetailView: View {
    var animal: Animal
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Image(animal.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                    .cornerRadius(12)
                    .shadow(radius: 8)
                
                Text(animal.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("**Distribution Area**: \(animal.distributionArea)")
                    
                    Divider()
                    
                    Text("**Habitat**: \(animal.habitat)")
                    
                    Divider()
                    
                    Text("**Animal Description**: \(animal.animalDescription)")
                }
            }
            .padding(.vertical, 80)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ContentView()
}
```

## Summary

In this lesson, we completed a simple animal encyclopedia page.

We first used the `Animal` structure to store animal information, then used an array to store five animals, and finally used `ForEach` to display the animal list.

When the user taps an animal, we save that animal into `selectedAnimal`:

```swift
selectedAnimal = animal
```

When `selectedAnimal` has a value, `.sheet(item:)` presents the detail view and passes the selected animal to `AnimalDetailView`.

The most important part of this lesson is not the interface style, but understanding this data-passing route:

```swift
Tap animal → selectedAnimal saves animal → Sheet is presented → AnimalDetailView displays details
```

After understanding this route, you can later create more similar features, such as product details, course details, article details, contact details, and so on.
