---
date: 2023-09-08
published: true
categories: notes
tags:
  - web
  - development
---


ReactJS
=======


React Hooks
-----------


### General Rules

1.  Functions must be pure (or at least functionally "pure").
2.  Hooks must fire in the same order, every time.
3.  Only call Hooks **at the top level** (in order to satisfy rule #2). Don’t call Hooks inside loops, conditions, or nested functions.


### `useState()`

-   State will be preserved between re-renders.
-   Does **not merge** state values with the state setter! You need to merge on your own.
-   The only argument is the initial state.
-   Initial state is only set and executed on first render.
-   Returns values in the order you initialized them, which is why the **order of execution must not change**.


### `useEffect()`


### `useRef()`

