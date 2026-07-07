# THE FOREST-PIXEL - GAME DESIGN DOCUMENT

## 1. VISION & CORE CONCEPT

**Genre**: 2D Pixel Survival Adventure  
**Platform**: PC (Windows, Mac, Linux) + Mobile (Android, iOS)  
**Target Audience**: Casual & Hardcore Survival Game Fans  
**Inspiration**: 99 Nights in the Forest, Stardew Valley, Don't Starve

### Core Pillars

1. **Survival**: Manage HP, Hunger, Thirst, Energy, Temperature
2. **Exploration**: Discover biomes, caves, creatures, secrets
3. **Building**: Create safe bases with campfire progression
4. **Progression**: Level up skills, unlock perks, complete quests
5. **Community**: Multiplayer, trading, cooperation, competition

---

## 2. CAMPFIRE SYSTEM (MAIN FEATURE)

### 2.1 What is a Campfire?

A **Campfire** is a safe haven in the dangerous forest. It provides:
- Protection from monsters
- Resource crafting station
- Rest & recovery point
- Base of operations
- Experience source for leveling

### 2.2 Campfire Progression

| Level | Safe Radius | Craft Speed | Regen Bonus | Resources Needed |
|-------|-------------|-------------|------------|------------------|
| **1** | 20 tiles | 1.0x | +50% HP | 10 Wood, 5 Stone |
| **2** | 35 tiles | 1.1x | +75% HP | 20 Wood, 10 Stone, 5 Ore |
| **3** | 50 tiles | 1.2x | +100% HP | 40 Wood, 20 Stone, 15 Ore |
| **4** | 70 tiles | 1.3x | +150% HP | 80 Wood, 40 Stone, 30 Ore, 15 Coal |
| **5** | 100 tiles | 1.5x | +200% HP | 150 Wood, 80 Stone, 60 Ore, 40 Coal, 30 Gold |

### 2.3 Leveling Campfire

**Method**: 
- Players must **feed resources** to the campfire
- Campfire has **EXP Bar** above it
- Reach 100% EXP → **Level Up**
- Each resource type gives different EXP amounts:
  - Wood: 5 EXP each
  - Stone: 10 EXP each
  - Ore: 20 EXP each
  - Coal: 30 EXP each
  - Gold: 50 EXP each

**EXP Requirements**:
- Lv1 → Lv2: 100 EXP
- Lv2 → Lv3: 250 EXP
- Lv3 → Lv4: 500 EXP
- Lv4 → Lv5: 1000 EXP

### 2.4 Safe Zone Mechanics

```
Inside Safe Zone (Campfire Radius):
✅ Monsters do NOT spawn
✅ Existing monsters will leave
✅ HP regenerates +50% to +200%
✅ Hunger decreases 50% slower
✅ Thirst decreases 50% slower
✅ Energy regenerates faster (rest)
✅ Crafting speed +10% to +50%
✅ Cannot be attacked by monsters
❌ Cannot attract boss monsters

Outside Safe Zone:
❌ Monsters spawn according to difficulty
❌ Boss monsters can appear
❌ Environmental hazards active
❌ Hunger/Thirst decrease normal rate
❌ No HP regen bonus
```

### 2.5 Multiple Campfires

- Players can build **up to 5 campfires** per world
- Each campfire levels independently
- Only **1 campfire can provide safe zone** at a time
- Other campfires act as **fast travel waypoints**
- Connecting campfires creates a **network**

---

## 3. SURVIVAL MECHANICS

### 3.1 Player Stats

```
HP: 0-100 | Current Health
├─ Decreases when damaged
├─ Regenerates in safe zone (+50% to +200%)
└─ Food/Healing items restore HP

Hunger: 0-100 | Stomach fullness
├─ Decreases over time (1 per second)
├─ Decreases 50% slower in safe zone
├─ Eating food restores hunger
└─ If 0: HP decreases 5 per second

Thirst: 0-100 | Hydration level
├─ Decreases over time (1 per second)
├─ Decreases 50% slower in safe zone
├─ Drinking water restores thirst
└─ If 0: HP decreases 5 per second

Energy: 0-100 | Stamina for actions
├─ Used for running, jumping, attacking
├─ Regenerates 5 per second (idle)
├─ Regenerates 10 per second (in safe zone)
└─ Sleeping restores to 100

Temperature: -20°C to +50°C | Body heat
├─ Affected by season & weather
├─ Cold decreases HP 2 per second
├─ Heat decreases Thirst 2 per second
├─ Campfire/Clothes provide insulation
└─ Safe zone buffers temperature by ±10°C

EXP: 0-∞ | Experience points
├─ Gained from exploring, killing, crafting
├─ Used to level up character
└─ Higher level = better stats & skills
```

### 3.2 Day/Night Cycle

- **Day**: 5 minutes of gameplay time
- **Night**: 3 minutes of gameplay time
- **Transition**: 30 seconds dawn/dusk

**Night Mechanics**:
- Monsters spawn 3x more frequently
- Visibility reduced by 50%
- Temperature drops 15°C
- Hunger increases 1.5x
- If outside after 22:00 without light: **Vision blocked**

---

## 4. RESOURCES & GATHERING

### 4.1 Harvestable Resources

```
WOOD
├─ From trees (10-20 wood per tree)
├─ Used for: Campfire, Building, Crafting
├─ Respawn: 5 minutes after harvest
└─ Tool: Axe (improves yield)

STONE
├─ From rocks (5-10 stone per rock)
├─ Used for: Campfire, Building, Crafting
├─ Respawn: 10 minutes after harvest
└─ Tool: Pickaxe (improves yield)

ORE (Copper, Iron, Silver)
├─ From ore deposits (3-5 ore per deposit)
├─ Used for: Smelting, Crafting advanced items
├─ Respawn: 20 minutes after harvest
└─ Tool: Pickaxe (required to mine)

COAL
├─ From coal deposits (2-4 coal per deposit)
├─ Used for: Smelting, Campfire leveling
├─ Respawn: 15 minutes after harvest
└─ Tool: Pickaxe (required to mine)

GOLD
├─ Rare ore (1-2 gold per deposit)
├─ Used for: Crafting legendary items, Trading
├─ Respawn: 30 minutes after harvest
└─ Tool: Pickaxe (required to mine)
```

---

## 5. INVENTORY & CRAFTING

### 5.1 Inventory System

```
┌─────────────────────────────────┐
│ INVENTORY                       │
├─────────────────────────────────┤
│ HOTBAR (8 slots)                │
│ [1] [2] [3] [4] [5] [6] [7] [8] │
├─────────────────────────────────┤
│ BACKPACK (24 slots - 3x8)       │
│ [  ] [  ] [  ] [  ] [  ] [  ]   │
│ [  ] [  ] [  ] [  ] [  ] [  ]   │
│ [  ] [  ] [  ] [  ] [  ] [  ]   │
│ [  ] [  ] [  ] [  ] [  ] [  ]   │
├─────────────────────────────────┤
│ Max Carry Weight: 50 kg          │
│ Current Weight: 35/50 kg         │
└─────────────────────────────────┘
```

**Features**:
- ✅ Drag & Drop items
- ✅ Stack up to 64 items per slot
- ✅ Quick-swap hotbar (1-8 keys)
- ✅ Sort by name/type
- ✅ Weight limit system
- ✅ Quick-drop (Q key)

---

## 6. BUILDING SYSTEM

### 6.1 Building Blocks

```
STRUCTURES
├─ Wall: 10 Wood, 5 Stone (blocks movement & attacks)
├─ Floor: 5 Wood, 3 Stone (walkable surface)
├─ Door: 15 Wood, 2 Iron (lockable entrance)
├─ Roof: 8 Wood, 5 Stone (covers from rain/sun)
├─ Fence: 8 Wood, 2 Stone (decorative barrier)
├─ Stairs: 10 Wood, 3 Stone (vertical access)
├─ Bridge: 15 Wood, 5 Stone (crosses water)
└─ Trap: 10 Wood, 5 Iron (damages enemies)

FURNITURE
├─ Bed: 20 Wood, 5 Leather (rest & sleep)
├─ Chest: 15 Wood, 5 Stone (storage)
├─ Workbench: 30 Wood, 15 Stone (crafting)
├─ Furnace: 50 Stone, 20 Coal (smelting)
├─ Campfire: 10 Wood, 5 Stone (heating & cooking)
└─ Cauldron: 20 Iron, 10 Stone (brewing)
```

---

## 7. PROGRESSION & SKILLS

### 7.1 Leveling System

- **XP Sources**: Crafting, Combat, Exploration, Quests
- **Levels**: 1-100
- **Stat Growth**: +5 HP, +2 Damage per level
- **Perks**: Every 5 levels unlock a new perk

### 7.2 Skills Tree

```
SURVIVAL
├─ Gathering (Wood, Stone, Ore)
├─ Cooking (Better food effects)
├─ Medicine (Healing potions)
└─ Fire Making (Camp efficiency)

COMBAT
├─ Melee (Sword damage +10%)
├─ Archery (Bow accuracy +15%)
├─ Defense (Armor effectiveness +20%)
└─ Evasion (Dodge chance +10%)

CRAFTING
├─ Metalworking (Ore smelting)
├─ Carpentry (Wood crafting)
├─ Alchemy (Potion brewing)
└─ Engineering (Building speed)
```

---

## 8. MULTIPLAYER SYSTEM

### 8.1 Authentication

```
REGISTRATION
├─ Username (3-20 chars)
├─ Email (valid email)
├─ Password (min 8 chars, hash with bcrypt)
├─ Age verification
└─ Email confirmation

LOGIN
├─ Username/Email
├─ Password
├─ 2FA (optional)
└─ Session token (24h expiry)
```

### 8.2 Server System

```
SERVER BROWSER
├─ List all public servers
├─ Filter by region, difficulty, players
├─ Show player count, ping, map seed
└─ Join with 1-click

PRIVATE SERVERS
├─ Whitelist players
├─ Set difficulty, weather, time
├─ Admin controls
└─ Up to 10 players
```

### 8.3 Admin Commands

```
/teleport <x> <y>          - Teleport player
/spawn <creature> <amount> - Spawn creatures
/fly                       - Toggle fly mode
/god                       - Toggle god mode
/time <hour>              - Set time of day
/weather <type>           - Set weather
/ban <player> <reason>    - Ban player
/kick <player> <reason>   - Kick player
/log                      - View activity logs
/reset-world              - Reset world
/backup                   - Create backup
```

---

## 9. ACHIEVEMENTS & QUESTS

### 9.1 Achievements

- **Survivor**: Survive 5 days
- **Gatherer**: Collect 1000 wood
- **Builder**: Build 10 structures
- **Explorer**: Discover all biomes
- **Boss Slayer**: Defeat all bosses
- **Hoarder**: Reach max inventory weight

### 9.2 Quest Types

| Type | Rewards | Examples |
|------|---------|----------|
| **Main** | 500 XP, Legendary Item | "Save the Forest" |
| **Side** | 100 XP, Resources | "Find Lost Artifact" |
| **Daily** | 50 XP | "Gather 50 Wood" |
| **Weekly** | 300 XP | "Defeat 5 Bosses" |

---

## 10. TECHNICAL SPECIFICATIONS

### 10.1 Performance Targets

- **FPS**: 60 FPS on mid-range devices
- **Load Time**: <3 seconds for chunks
- **Memory**: <500MB peak usage
- **Network**: <100ms latency

### 10.2 Platforms

| Platform | Status | Performance |
|----------|--------|-------------|
| **PC (Win/Mac/Linux)** | ✅ Primary | 60 FPS @ 1080p |
| **Android** | ✅ Planned | 30-60 FPS |
| **iOS** | ✅ Planned | 30-60 FPS |
| **Web (Browser)** | 🔄 Possible | 30 FPS (Phaser) |

### 10.3 Save System

```
AUTO SAVE
├─ Every 2 minutes
├─ Stores: Player position, inventory, world state
└─ 5 backup slots

CLOUD SAVE
├─ Sync to server
├─ Cross-device support
└─ Restore from any device

BACKUP
├─ Manual save before major events
├─ Up to 10 backups per world
└─ One-click restore
```

---

**Document Version**: 1.0  
**Last Updated**: 2026-07-07  
**Status**: Ready for Development