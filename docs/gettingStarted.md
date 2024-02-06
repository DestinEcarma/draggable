---
sidebar_position: 2
---

# Getting Started

To get started using the Draggable module, follow these simple steps:

1. We first need to require the module:

   ```lua
   local Draggable = require(--[[ Path ]]) -- Example game.ReplciatedStorage.Draggable
   ```

2. Create a Draggable Class for your GuiObject:

   ```lua
   local myFrame = script.Parent.Frame

   local draggableObject = Draggable.new(myFrame)
   ```

Now your GuiObject is draggable! Once you have decided to stop the dragging capability, simply call the `Destroy` method on the class.