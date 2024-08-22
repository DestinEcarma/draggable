# Changelog

## 1.1.3

- Fixed boundary bug

## 1.1.2

- Improved Destroy Method
- Draggable `new` will now throw an error if argument #1 is a GuiButton.
- Draggable `Include` will not accept and throw a warning if it contains a GuiButton.
- Draggable `IncludeDescendants` will now ignore GuiButtons.

## 1.1.1

- Prototype transferred differencing the `parent.AbsolutePosition` from `Dragging` to `Began`.
- EventHandler `InputBegan` will now only recognize if the GuiObject's Interactable is enabled.
- EventHandler `InputBegan` will now ignore GuiButtons.
- EventHandler `InputChanged` removed `gameProccessedEvent`.
- EventHandler optimized some of the if conditions.

## 1.1.0

- Add auto destroy when draggable GuiObject is destroyed.
- Add boundary property
- Removed `ipairs` on every for loop.
- Update documentation

## 1.0.2

- Add documentation

## 1.0.1

- Fix wally package

## 1.0.0

- Initial Release
