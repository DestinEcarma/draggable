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

   :::important
   Make sure that the GuiObject's [Interactable](https://create.roblox.com/docs/reference/engine/classes/GuiObject#Interactable) is set to `true`.
   :::

Now your GuiObject is draggable! Once you have decided to stop the dragging capability, simply call the [`Destroy`](../api/Draggable#Destroy) method on the class.
