# img2icon

[![Build Status](https://travis-ci.org/getopenmono/img2icon.svg?branch=master)](https://travis-ci.org/getopenmono/img2icon) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/getopenmono/img2icon?branch=master&svg=true "AppVeyor Build Status")](https://ci.appveyor.com/project/stoffera/img2icon)

**This tool will convert a bitmap image (gif, bmp, jpg, png) into Mono's _Icon_ format**

It is a crude tool, it reads the alpha channel (if exists) and output a header file with an array of alpha values.

## Usage

```
Options:
  -h, --help                     Displays this help.
  -v, --version                  Displays version information.
  -d, --destination <directory>  The directory to place the converted file in
  -g, --grey                     Use monochrome channel and not alpha values
  -s, --size X,Y                 Downscale to X times Y pixels.
  -i, --invert                   Invert the bitmap values, dark is light and
                                 light is dark.

Arguments:
  input                          Source image file.
```

### Example

Convert the file `push-button-image-24.png` to a mono icon:

```
$ img2icon push-button-image-24.png
Input image size is:  QSize(24, 24)
Global C variable: "pushButtonImage24"
```
The result is a header file named after the input file: `push-button-image-24.h`

Now, include the header file in your project and uses the Mono Framework class `mono::ui::IconView` to display the icon:

```cpp
#include "path/to/push-button-image-24.h"

using mono::ui:IconView;
using mono::geo:Point;

class AppController : public mono::IApplication {
	
	IconView btnIcon;
	
	AppController() : 
		btnIcon(Point(176/2-24/2, 220/2-24/2), pushButtonImage24)
	{
		btnIcon.show();
	}
	
	// ...
};	
``` 
Now the icon is displayed at the center of the screen.

## MonoIcon format

The icon format is a 2-dimensional array of 8-bit integers. It defines pixels whose values are alpha channel level or the blending of two colors.

The class `IconView` uses these values to blend foreground and background colors. A value of 0 is full background, while 255 is total foreground.

You can define the fore- and background colors, thereby changing the appearence of the icon.

Because the icon format is defined like this, it works best with PNG's that have an alpha channel.
