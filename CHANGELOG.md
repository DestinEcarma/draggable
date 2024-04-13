# Changelog

## 1.1.1

- Transferred differencing the `parent.AbsolutePosition` from `Dragging` to `Began` in Prototype.
- EventHandler InputBegan will now only recognize if the GuiObject's Interactable is enabled.
- EventHandler InputBegan will now ignore GuiButtons.
- EventHandler InputChanged removed `gameProccessedEvent`.
- Optimized some of the if conditions in `EventHandler`.

## 1.1.0

### Added

- Add auto destroy when draggable GuiObject is destroyed.
- Add boundary property

### Removed

- Removed `ipairs` on every for loop.

### Updated

- Update documentation

## 1.0.2

- Add documentation

## 1.0.1

- Fix wally package

## 1.0.0

- Initial Release
