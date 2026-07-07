# The Forest-Pixel - Development Roadmap

## 🎯 Version Overview

### v0.1 - Engine Foundation (Weeks 1-2)
**Goal**: Build core game engine and basic systems
- [x] Godot project setup (4.1+)
- [x] Git repository initialization
- [ ] Player controller (WASD + Mouse)
- [ ] Camera system with following
- [ ] Basic scene management
- [ ] Game loop with fixed timestep

**Deliverables**:
- Playable character movement
- Camera following player
- Basic UI framework

---

### v0.2 - Resource System (Weeks 3-4)
**Goal**: Implement resource gathering mechanics
- [ ] Resource types (Wood, Stone, Ore, Coal, Gold)
- [ ] Resource nodes in world
- [ ] Basic gathering mechanics (click to harvest)
- [ ] Respawn system for resources
- [ ] Resource particle effects

**Deliverables**:
- Gather wood from trees
- Gather stone from rocks
- Gather ore from deposits
- Visual feedback on gathering

---

### v0.3 - Survival Mechanics (Weeks 5-6)
**Goal**: Add survival stat system
- [ ] HP, Hunger, Thirst, Energy, Temperature stats
- [ ] Stat management (decrease over time)
- [ ] Day/Night cycle (5 min day, 3 min night)
- [ ] Weather system (Rain, Storm, Clear)
- [ ] Basic HUD display
- [ ] Food consumption
- [ ] Water drinking

**Deliverables**:
- Working survival stats
- Day/Night transitions
- Weather effects on gameplay
- Player death on stat failure

---

### v0.4 - Campfire System (Weeks 7-8)
**Goal**: Implement primary game feature - campfires
- [x] Campfire system code (5 levels)
- [ ] Campfire placement mechanics
- [ ] Safe zone visualization
- [ ] Campfire leveling UI
- [ ] Resource feeding to campfire
- [ ] Experience bar above campfire
- [ ] Map expansion with levels
- [ ] Resource requirement display

**Deliverables**:
- Build and place campfires
- Level up campfires with resources
- Safe zone protection (no monsters)
- Visible map expansion as you level

---

### v0.5 - Building System (Weeks 9-10)
**Goal**: Implement construction and shelter
- [ ] Building placement system
- [ ] Structure types (Wall, Floor, Door, Roof, etc.)
- [ ] Building costs (resource deduction)
- [ ] Structure durability system
- [ ] Demolition mechanics
- [ ] Building preview/ghost placement
- [ ] Collision with structures
- [ ] Storage chests (Inventory expansion)

**Deliverables**:
- Build wooden shelter
- Place doors and windows
- Store items in chest
- Demolish structures

---

### v0.6 - Creatures & Combat (Weeks 11-12)
**Goal**: Add animals and enemies
- [ ] Animal AI (Deer, Rabbit, Chicken, Fish)
- [ ] Monster AI (Goblin, Wolf, Skeleton, Zombie)
- [ ] Boss monsters (5 types)
- [ ] Combat system (Click to attack)
- [ ] Damage calculation
- [ ] Knockback effects
- [ ] Creature drops (Meat, Leather, Bones)
- [ ] Spawn system

**Deliverables**:
- Hunt animals for food
- Defend against monsters
- Boss encounters
- Loot system

---

### v0.7 - Crafting & Progression (Weeks 13-14)
**Goal**: Add crafting and character progression
- [ ] Crafting system framework
- [ ] Recipes database
- [ ] Crafting stations (Workbench, Furnace)
- [ ] Skill tree
- [ ] XP system
- [ ] Level up mechanics
- [ ] Perks/Talents
- [ ] Equipment system

**Deliverables**:
- Craft tools and weapons
- Craft food and potions
- Level up character
- Unlock new recipes with levels

---

### v0.8 - Content & Polish (Weeks 15-16)
**Goal**: Add content and improve user experience
- [ ] Quest system (Main, Side, Daily, Weekly)
- [ ] Achievement system
- [ ] NPC system (Merchant, Blacksmith, Hunter)
- [ ] Trading system
- [ ] Sound effects
- [ ] Background music
- [ ] Pause menu
- [ ] Settings menu

**Deliverables**:
- Complete quest line
- Unlock achievements
- Trade with NPCs
- Audio throughout game

---

### v0.9 - Multiplayer Foundation (Weeks 17-18)
**Goal**: Implement multiplayer infrastructure
- [ ] Backend server setup
- [ ] Player authentication
- [ ] Server browser
- [ ] Player synchronization
- [ ] Chat system
- [ ] Friends list
- [ ] Party system
- [ ] Admin commands

**Deliverables**:
- Multiple players in one world
- Cross-player communication
- Server hosting options
- Admin panel

---

### v1.0 - Release (Weeks 19+)
**Goal**: Polish and launch
- [ ] Optimization (FPS, memory, network)
- [ ] Bug fixes
- [ ] Balance adjustments
- [ ] Performance testing
- [ ] Localization (i18n)
- [ ] Final Polish
- [ ] Version 1.0 Release

**Deliverables**:
- Stable, playable game
- 60+ FPS on target hardware
- <500MB memory usage
- Feature-complete experience

---

## 📊 Current Status

### In Progress
- **v0.1**: Engine Foundation (Core systems designed, waiting implementation)

### Completed
- Project repository created
- Game design document finalized
- Core systems designed (Campfire, Survival, Inventory, World)
- Backend infrastructure scaffolded

### Upcoming Priorities
1. ✅ Player controller implementation
2. ✅ Camera system
3. ✅ World generation
4. ⏳ Resource spawning
5. ⏳ Survival stats UI

---

## 🎓 Learning Resources

- **Godot Docs**: https://docs.godotengine.org/
- **GDScript Guide**: https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/
- **2D Games**: https://docs.godotengine.org/en/stable/community/tutorials.html

---

## 👥 Team Roles (Open for Contributions)

| Role | Status | Current |
|------|--------|----------|
| **Game Design Lead** | ✅ Assigned | @mthonh2001-commits |
| **Programming Lead** | ⏳ Needed | Open |
| **Art Director** | ⏳ Needed | Open |
| **Sound Designer** | ⏳ Needed | Open |
| **QA Lead** | ⏳ Needed | Open |

---

**Last Updated**: 2026-07-07  
**Target Release**: Q4 2026