# Slime Mobile Game (no title yet)

Core Game Play
 
Game Mechanics: 
- Has game mechanics like Everwing
- Infinite Stage after Standard Levels
- Slime bosses with minions,  the bosses move backwards while facing you while throwing projectiles at you, there are also minions that spawn depending on the difficulty of that current level
- Elemental slimes which shoot different types of fireballs
- Slime boss can be weak or strong against certain elements
- You only have 3 slimes, while playing the game you run across special slimes that you can kill and they will drop their core, you can then choose to replace your current slimes by picking them up
- If the slime’s core touches the hitbox of the slime you want to change into you the slime will be replaced
- We can implement different slime attributes and elements
- Points System
- Slimes drop elemental crystals that change slime element
- Slimes need to be color coded for easy forgor the word

Slime Logic:
Slime Models:
- The different elements will now be separate characters, each one has a unique form of attack.
- Making different elements into separate chars can encourage players to keep playing as well as encourage whales to spend money to unlock characters faster.
- Cosmetic items like masks and hats can be made to encourage more player spending
- We could still implement the 3 slime types here

Player Action:
Movement:
- Slime just zooms through the level while leaving a trail of “goo” behind.
- Jumping for the “walk” animation no longer works for player since its gonna look weird when the char moves to different directions mid-air
- Slime looks to the direction where it is going. (Dk if we need to do something special here like using an animation tree or a simple look_at() method is fine)
Attacks:
- Slimes automatically attack rapidly similar to everwing
- Attacks get stronger by absorbing enemy slime cores (I’ll make different vfx for the attacks whenever it gets stronger)
- Different attacks depending on the slime type
