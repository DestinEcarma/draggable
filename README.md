# Draggable

This module is designed to empower Roblox developers to easily implement draggable functionality for their [GuiObjects](https://create.roblox.com/docs/reference/engine/classes/GuiObject). With intuitive methods, developers can enhance user interactions by making GUI elements draggable within the game environment.

## Getting Started

To get started with the Draggable module, follow these simple steps:

1. Requiring the module:

   ```lua
   local Draggable = require(--[[ Path ]]) -- Example: game.ReplicatedStorage.Draggable
   ```

2. Create a Draggable Class for your GuiObject:

   ```lua
   local myGuiObject = script.Parent["Make This GuiObject Draggable"]
   local draggableClass = Draggable.new(myGuiObject)
   ```

Now your GuiObject is draggable! Once you have decided to stop the dragging capability, simply call the `Destroy` method on the class.

## Properties

### Enabled

```lua
Draggable.Enabled: Boolean
```

Determines whether a GuiObject is Draggable.

## Methods

### Destroy

```lua
Draggable:Destroy() -> ()
```

Removes the draggable capability from the associated GuiObject.

### IncludeDescendants

```lua
Draggable:IncludeDescendants() -> ()
```

Allows the user to drag frames that are descendants of the GuiObject.

### Include

```lua
Draggable:Include(descendantsArray: {GuiObject}) -> ()
```

Same as `IncludeDescendants`, but the developer can pass an array containing specific descendants of the GuiObject to be draggable.

## Events

### Began

```lua
Draggable.Began:Connect(function(mousePosition: Vector2) end) -> Signal
```

Fired when a user begins interacting with the GuiObject.

### Dragging

```lua
Draggable.Dragging:Connect(function(mousePosition: Vector2) end) -> Signal
```

Fired when a user started moving the GuiObject.

### Ended

```lua
Draggable.Ended:Connect(function(mousePosition: Vector2) end) -> Signal
```

Fired when a user stopped interacting with the GuiObject.
