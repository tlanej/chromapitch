# Chromesthesia Trainer

An immersive audio-visual training application for developing synesthetic associations between musical notes and colors.

## 🚀 Quick Start

### Option 1: Docker Compose (Recommended)
```bash
cd chromesthesia
docker-compose up -d
# Open http://localhost:8080
```

### Option 2: Docker Build
```bash
cd chromesthesia
docker build -t chromesthesia .
docker run -p 8080:80 chromesthesia
# Open http://localhost:8080
```

### Option 3: Python (No Docker)
```bash
cd chromesthesia
python3 -m http.server 8080
# Open http://localhost:8080
```

### Option 4: Use the run script
```bash
cd chromesthesia
chmod +x run.sh
./run.sh           # Docker Compose
./run.sh python    # Python server
./run.sh stop      # Stop containers
```

## 🎮 Features

### Training Modes
- **Free Play** - Explore the keyboard with color feedback
- **Learn Mode** - See note/color associations with audio
- **Note → Color** - Hear a note, pick the matching color
- **Color → Note** - See a color, identify the note

### Color Systems
- **Scriabin (Circle of Fifths)** - Classic synesthetic mapping
- **Newton (Spectral)** - Rainbow frequency mapping
- **Therapeutic (Calming)** - Muted, grounding tones
- **Warm Spectrum** - Reds, oranges, golds
- **Cool Spectrum** - Blues, greens, purples

### Controls
- **Keyboard**: A-J for white keys, W/E/T/Y/U for black keys
- **Waveforms**: Sine, Triangle, Square, Sawtooth
- **Volume**: Adjustable -30dB to 0dB

### Progress Tracking
- Accuracy percentage
- Current streak
- Best streak
- Session history

## 🎯 Therapeutic Applications

This trainer is designed for:
- Building note-color associations for chromesthesia development
- Color biofeedback preparation
- Multi-sensory integration training
- EEG-based therapeutic interventions

## 📁 Files

```
chromesthesia/
├── index.html        # Self-contained app (no build needed)
├── Dockerfile        # Docker image definition
├── docker-compose.yml # One-command startup
├── run.sh            # Multi-option startup script
└── README.md         # This file
```

## 🛠 Technical Details

- **No build step required** - Runs directly in browser
- **Dependencies loaded via CDN**:
  - React 18
  - Tone.js for audio synthesis
  - Tailwind CSS for styling
- **Lightweight** - Single HTML file ~25KB

## 🔧 Customization

To add custom color mappings, edit the `COLOR_SYSTEMS` object in `index.html`:

```javascript
custom: {
  name: "My Custom Mapping",
  colors: {
    'C': { hex: '#FF0000', name: 'Red' },
    // ... add all 12 notes
  }
}
```

## 📄 License

MIT - Use freely for therapeutic and educational purposes.
