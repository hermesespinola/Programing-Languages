# Monkey and banana

The problem consists in finding the series of states
a monkey has to go through in order to get a banana
that is hanging on the ceiling, giving that the
monkey is in a room and there is a box he can move and
get on top of that to reach the banana.

A state is defined by four elements, each one represents:
1. The position of the monkey.
2. The state of the monkey relative to the box (ontop | onfloor).
3. The position of the box.
4. If the monkey has the banana.

The monkey can perform a move to go from one state to another only
if its previous state meets certain properties. For example:
- The monkey can walk to any position in the room.
- The monkey can only push the box from P1 to P2
if it's in the same position.
- The monkey can climb the box if it's in the same position.
- The monkey can only grasp the banana if he's on the box and in the
middle of the room.

The `canget(state(_, _, _, has)).` is a fact that will return true
iff the monkey has the banana.

```
move(state(middle, onbox, middle, hasnot),
    grasp,
    state(middle, onbox, middle, has)).
```
The above rule means that if the monkey and the box are in the
middle of the room, the monkey is on the crate and has not the
banana yet he will grab it.

```
move(state(P, onfloor, P, H),
    climb,
    state(P, onbox, P, H)).
```
The above rule means that the monkey can climb the box only if
both the monkey and the box are at position `P`.

```
move(state(P1, onfloor, P1, H),
    push(P1, P2),
    state(P2, onfloor, P2, H)).
```
The above line means that the monkey can push the box from `P1` to
`P2` iff both the monkey and the box are in the same position.

```
canget(State1) :-
  move(State1, _, State2),
  canget(State2).
```
This rule will make the monkey travel through all possible states
until it reaches the fact `canget(state(_, _, _, has))` or all
possible states are exhausted.

When call `canget(state(atdoor, onfloor, atwindow, middle, hasnot))`
what will happen is that it will try to unify with each fact, first,
it will try to grasp the banana but will not be able because the monkey is not in the middle, not on the box, the box not in the middle. The monkey will not climb nor push the box because they are not in the same position. The monkey will be able to move to the window, then it will be able to unify with the climb move. But it will fail since it cannot grasp the banana. The it will explore other moves, it will push the box to the middle of the room, will unify with the action climb and then it will be able to grasp the banana.
