# Brick Breaker Game

Welcome to the Brick Breaker Game, a classic arcade-style game implemented entirely in x86 Assembly language. This project demonstrates low-level programming skills and provides an engaging and challenging gaming experience.

## Features

- **Single-Player Mode**: Play solo and aim to break all the bricks.
- **Multiplayer Mode**: Compete with a friend using separate paddles.
- **Power-Ups and Power-Downs**: Enhance or challenge gameplay with special effects:
  - Paddle resizing
  - Speed modifications
  - Score multipliers
- **Dynamic Difficulty**: Ball speed increases as you progress through levels.
- **Pause and Resume**: Pause the game anytime and resume seamlessly.
- **Sound Effects**: Feedback for collisions, power-ups, and level completions.

## Getting Started

### Prerequisites

- **DOSBox**: A DOS emulator for running the game on modern systems.
- **MASM**: Microsoft Macro Assembler to compile the assembly code.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/brick-breaker.git
    ```

2. Assemble the code using MASM:

    ```bash
    masm main.asm;
    link main.obj;
    ```

3. Run the game in DOSBox:

    ```bash
    dosbox main.exe
    ```

## Controls

- **Arrow Keys**: Move the paddle left and right.
- **P**: Pause the game.
- **R**: Resume the game.
- **S**: Restart the game.
- **Enter**: Select options in the menu.

## Game Logic

### Overview

The game operates on a real-time loop that handles rendering, input processing, and game state updates. Core components include ball movement, collision detection, brick management, and power-up interactions.

### Key Components

- **Game Loop**:
  - Ensures smooth frame updates by synchronizing with the system clock.
  - Processes player input, updates the game state, and renders the screen.

- **Ball Movement**:
  - Ball position is updated each frame based on velocity (`BALL_SPEED_X`, `BALL_SPEED_Y`).
  - The ball reverses direction upon hitting walls, paddles, or bricks.

- **Collision Detection**:
  - **Walls**: Ensures the ball stays within screen boundaries.
  - **Paddle**: Prevents the ball from falling below the screen.
  - **Bricks**: Detects and handles collisions, updating the score and removing bricks.

- **Power-Ups and Power-Downs**:
  - Special items that modify gameplay:
    - Increase or decrease paddle size.
    - Adjust paddle speed.
    - Apply score multipliers.

- **Game States**:
  - **Welcome Screen**: Choose between single-player, multiplayer, or exit.
  - **Gameplay**: Main game loop.
  - **Pause**: Freezes the game state.
  - **End Game**: Displays win/loss messages.

- **Multiplayer Mode**:
  - Introduces a second paddle with independent controls.
  - Allows competitive gameplay.

- **Dynamic Difficulty**:
  - Ball speed increases as bricks are destroyed to maintain challenge.

- **Sound Effects**:
  - Feedback for key events like collisions and power-ups using the PC speaker.

## Code Structure

- **main.asm**: Contains all game logic, rendering routines, and event handling.
- **Procedures**: Modular functions for tasks like drawing, collision handling, and managing power-ups.
- **Variables**: Configurations for paddle dimensions, ball speed, and brick layout.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch:

    ```bash
    git checkout -b feature-name
    ```

3. Commit your changes:

    ```bash
    git commit -m "Add new feature"
    ```

4. Push your branch:

    ```bash
    git push origin feature-name
    ```

5. Open a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments

- Inspired by the classic Brick Breaker arcade game.
- Built for educational purposes to demonstrate x86 Assembly programming.
