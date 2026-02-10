# minilogo
A mini logo interpreter written in MSX Basic

[![English](https://img.shields.io/badge/language-English-blue)](README.md) [![Português](https://img.shields.io/badge/language-Português-green)](README.pt.md)

# What?

You use commands to move a triangular turtle on your computer screen and draw.

# Why?

I woke up craving to write something. I like LOGO, I like BASIC, I like MSX, so why not?

# How?

Run the program in your favorite MSX computer. It accepts the following commands:

- qt: exit to BASIC
- fw **<n>**: Move the turtle forward n pixels
- bk <n>: Move the turtle back n pixels
- rg <n>: Turn the turtle right by n degrees
- lf <n>: Turn the turtle left by n degrees
- pr <w>: Print a single word in the screen
- rp <n> [ ... ]: repeat n times the commands inside []. currently does not support nesting
- cl: clear the screen
- dr <n>: either turns on (1) or off (0) drawing
- xy <n> <n>: move turtle to a position onscreen. won't affect the angle

# Why are the error messages in portuguese if the commands are in english?

Who knows? It's just the way my brain works.

# What's next?

- Make the triangular turtle a real turtle
- Make it spin depending on the angle
- Create a fixed sin table directly on degrees (0-89) instead of using trigonometrical functions
- Allow at least on level of nesting
- Integer variables
- Allow negative numbers
