# The Forest-Pixel 🌲

**A 2D Pixel Survival Game inspired by 99 Nights in the Forest**

## 🎮 Game Overview

**The Forest-Pixel** is a 2D pixel survival adventure game where you must explore a mysterious forest, gather resources, build shelter, and survive against the elements and creatures that lurk within.

### Core Features

- **Survival Mechanics**: HP, Hunger, Thirst, Energy, Temperature
- **Campfire System**: Safe zones with level progression and map expansion
- **Resource Gathering**: Trees, stones, ore, plants, flowers, mushrooms
- **Building System**: Walls, floors, doors, roofs, fences, chests, beds
- **Crafting**: Workbench, Furnace, Campfire, Cooking
- **Dynamic World**: Day/Night cycle, Weather, Seasons, Caves, Rivers, Lakes
- **Creatures**: Animals, Monsters, Boss fights
- **Inventory & Hotbar**: Drag & drop, stacking, sorting
- **Multiplayer Ready**: Registration, Login, Server Browser, Chat, Friends, Party, Clans
- **Admin System**: Teleport, Spawn, Fly, God Mode, Weather Control, Logs
- **Progression**: Skills, Perks, Achievements, Quests (Main, Side, Daily, Weekly)

---

## 📋 Campfire System (Main Feature)

### What is Campfire?

A **safe zone** where you can rest, craft, and progress safely. Campfires are the heart of your survival base.

### Mechanic

```
Campfire Level ━━━━━━━━━━━━━━━━━━━━━━━━━ EXP Bar

Lv1: Safe Zone Radius = 20 tiles | Cost: 10 Wood, 5 Stone
Lv2: Safe Zone Radius = 35 tiles | Cost: 20 Wood, 10 Stone, 5 Ore
Lv3: Safe Zone Radius = 50 tiles | Cost: 40 Wood, 20 Stone, 15 Ore
Lv4: Safe Zone Radius = 70 tiles | Cost: 80 Wood, 40 Stone, 30 Ore, 15 Coal
Lv5: Safe Zone Radius = 100 tiles | Cost: 150 Wood, 80 Stone, 60 Ore, 40 Coal, 30 Gold
```

### Benefits

- ✅ No monsters spawn inside radius
- ✅ HP regeneration +50% inside zone
- ✅ Hunger decreases slower inside zone
- ✅ Can sleep/rest at campfire
- ✅ Faster crafting inside zone
- ✅ Map expands as campfire levels up

---

## 🛠️ Tech Stack

- **Engine**: Godot 4.x (Open Source, Free)
- **Language**: GDScript
- **Graphics**: 2D Pixel Art (16x16 tiles)
- **Database**: SQLite (Local) + Backend (Multiplayer)
- **Backend**: Node.js + Express (for multiplayer)

---

## 📁 Project Structure

```
The-Forest-Pixel/
├── godot/                    # Godot project files
│   ├── project.godot
│   ├── scenes/
│   │   ├── player/
│   │   ├── world/
│   │   ├── ui/
│   │   ├── campfire/
│   │   ├── buildings/
│   │   └── creatures/
│   ├── scripts/
│   │   ├── player_controller.gd
│   │   ├── world_generator.gd
│   │   ├── survival_stats.gd
│   │   ├── inventory_manager.gd
│   │   ├── crafting_system.gd
│   │   ├── campfire_system.gd
│   │   └── ai_controller.gd
│   ├── assets/
│   │   ├── sprites/
│   │   ├── tilesets/
│   │   ├── audio/
│   │   └── fonts/
│   └── ui/
│       ├── hud.tscn
│       ├── inventory_ui.tscn
│       ├── crafting_ui.tscn
│       └── minimap.tscn
├── backend/                  # Node.js Backend (Multiplayer)
│   ├── server.js
│   ├── routes/
│   ├── controllers/
│   ├── models/
│   └── utils/
├── docs/                     # Documentation
│   ├── GAME_DESIGN.md
│   ├── MECHANICS.md
│   ├── API_SPEC.md
│   └── ROADMAP.md
├── .github/
│   └── workflows/
│       └── ci.yml
└── LICENSE
```

---

## 🚀 Quick Start

### Prerequisites

- Godot 4.x
- Node.js 16+ (for backend)
- Git

### Installation

```bash
# Clone repository
git clone https://github.com/mthonh2001-commits/The-Forest-Pixel.git
cd The-Forest-Pixel

# Open Godot Project
cd godot
godot

# (Optional) Setup Backend
cd backend
npm install
npm start
```

---

## 📊 Roadmap

- **v0.1**: Engine Setup + Core Game Loop
- **v0.2**: Resource System + Gathering
- **v0.3**: Survival Mechanics + Day/Night
- **v0.4**: Building System + Campfire Levels
- **v0.5**: Creatures + Basic AI
- **v0.6**: Crafting + Inventory
- **v0.7**: Quests + Progression
- **v0.8**: Multiplayer Foundation
- **v0.9**: Polish + Optimization
- **v1.0**: Release Candidate

---

## 👥 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📝 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## 🎨 Credits

**Inspired by**: 99 Nights in the Forest

**Developed by**: The Forest-Pixel Team

---

## 📞 Support

- 🐛 **Bug Reports**: [GitHub Issues](https://github.com/mthonh2001-commits/The-Forest-Pixel/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/mthonh2001-commits/The-Forest-Pixel/discussions)
- 🎮 **Discord**: [Join Community](https://discord.gg/theforest)

---

**Happy Surviving! 🌲🔥**