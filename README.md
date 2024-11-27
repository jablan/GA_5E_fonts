# Fonts for Radioddity GA-5E

If you, like me, managed to screw up fonts on your GA-5E by uploading the font from the "P15UV CPS" sync tool provided by Radioddity, here's a solution.

## TL;DR:

* Copy `.font` files to your `Program Files/P15UV CPS/Data/EnglishFont` directory.
* Start the sync app
* Enter the "embedded text" dialog
* Select one of the new fonts in "English font" dropdown
* Write to your device

## Some background info

I reverse engineered the way fonts the device expects are written and managed to create a couple. Unfortunately I don't have the original one. If someone provides the original firmware, I might be able to extract it though.

The fonts in GA-5E seems to be 11x20 pixels, although in frequency mode display, they are showed more densely, so if you indeed use 11px wide fonts, the digits will be stripped. Therefore it's better to use narrower font (8 or 9 pixel), although this looks weird in the menu for example. I think the original font combines narrower font for digits, and wider font for letters, so theoretically this can be done too.

The fonts are encoded pixel column by column, with 3 bytes per single column, 11 such columns per glyph.

`generate.rb` is a Ruby script I used to generate fonts from some existing bitmap fonts, it expects "hex" format, which is produced by some tools such as [gbdfed](https://github.com/andrewshadura/gbdfed).

Feel free to play around with it.

## Disclaimer

No liability from my side if you damage your devices.
