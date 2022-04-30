/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;		/* -b  option; if 0, dmenu appears at bottom */
static int centered = 0;	/* -c option; centers dmenu on screen */
static unsigned int min_width = 1000;	/* minimum width when centered */
static const char *fonts[] = {
	/* -fn option overrides fonts[0]; default X11 font or font set */
	"JetBrains Mono Medium:pixelsize=15:antialias=true:autohint=true", /* Mono */
	//"monospace:size=11",
	"JoyPixels:pixelsize=20:antialias=true:autohint=true"
	//"Hack Nerd Font:pixelsize=15:antialias=true:autohint=true", /* Powerline */
	//"Noto Color Emoji:pixelsize=20:antialias=true:autohint=true: style=Regular", /* Unicode */
	//"SauceCodePro Nerd Font:pixelsize=15:antialias=true:autohint=true"
	//"Symbola:pixelsize=15:antialias=true:autohint=true" /* Unicode */
};
static const char *prompt = NULL; /* -p  option; prompt to the left of input field */

static const char *colors[SchemeLast][2] = {
      			/*  fg       bg     */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel]  = { "#eeeeee", "#005577" },
	[SchemeOut]  = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/* 1 means the selection follows your cursor (only visible in vertical list) */
static int indent = 0;

/* 1 means cycle from the end/start to the start/end */
static int cycle = 1;

/* Characters not considered part of a word while deleting words
 * for example: " /?\"&[]" */
static const char worddelimiters[] = " ";
