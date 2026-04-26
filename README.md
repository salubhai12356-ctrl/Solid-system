# 🎮 Zen Blocks Flow - Mobile Puzzle Game

An addictive, stress-free puzzle game for Android built with Godot 4.3 and GDScript.

## 🎯 Game Concept

**Zen Blocks Flow** is a minimalist puzzle game where:
- Tap and drag to connect adjacent blocks of the **same color**
- Match 3+ blocks in a continuous path to clear them
- Build combos for higher scores
- Progress through levels with increasing difficulty
- No pressure, no competition - just pure puzzle fun!

## ✨ Features

✅ **4×6 Dynamic Grid** - Perfect mobile layout  
✅ **5 Vibrant Colors** - Beautiful, minimalist palette  
✅ **Block Matching** - Adjacent selection with color matching  
✅ **Scoring System** - Points × Level multiplier + Combo bonuses  
✅ **Progressive Difficulty** - Levels increase with score  
✅ **Smooth Animations** - Tween-based block movement  
✅ **Mobile Optimized** - Touch controls, vertical 540x960 aspect ratio  
✅ **Zero Pressure** - No timers, no lives, just fun!

## 🎮 How to Play

1. **Tap** a colored block to start a path
2. **Drag to adjacent blocks** of the same color to extend the path
3. **Match 3+ blocks** to clear them and earn points
4. **Build combos** for bonus points
5. **Progress through levels** as your score increases

## 📁 Project Structure

```
Zen-Blocks-Flow/
├── project.godot          # Godot project configuration
├── scenes/
│   ├── Main.tscn         # Main game scene
│   └── Block.tscn        # Block template scene
├── scripts/
│   ├── GameManager.gd    # Core game logic & grid management
│   ├── Block.gd          # Individual block behavior
│   └── UIManager.gd      # UI display management
└── README.md
```

## 🚀 Getting Started

### Requirements
- Godot Engine 4.3+
- GDScript (built-in)

### Setup

1. Clone the repository
2. Open the project in Godot 4.3
3. Press **F5** or click **Play** to test
4. To export to Android:
   - Go to **Project → Export**
   - Create an Android preset
   - Configure your Android SDK settings
   - Click **Export All**

## 🎮 Game Mechanics

### Scoring
- Base points: `blocks_matched × 10 × current_level`
- Combo bonus: `+5 points per combo count`
- Level up: Every 500 points unlocks next level

### Block Refill
- Matched blocks are removed
- Remaining blocks fall down
- New blocks spawn from top with smooth animation

### Difficulty Scaling
- Levels unlock automatically with score
- Higher levels = better points multiplier
- Grid randomizes fresh on each refill

## 💡 Why This Game Works

🧘 **Low Competition** - No PvP, no leaderboards, just personal bests  
🎯 **Universal Appeal** - Simple rules, engaging gameplay for all ages  
⚡ **Addictive Loop** - Quick sessions, easy to resume, hard to quit  
🌈 **Stress-Free** - Zen aesthetics, no time pressure, no punishment  
🆕 **Fresh Concept** - Blend of puzzle + flow mechanics  

## 🔮 Future Enhancements

- [ ] Power-ups (Bomb, Freeze, Reshuffle)
- [ ] Particle effects & screen shake
- [ ] Sound & background music
- [ ] Game Over screen & restart
- [ ] Local high score tracking
- [ ] Different game modes
- [ ] Daily challenges
- [ ] Haptic feedback for mobile

## 📝 License

MIT License - Feel free to modify and distribute!

## 👨‍💻 Development

Built with ❤️ using Godot Engine

---

**Ready to play?** Open in Godot and press F5! 🎮✨
