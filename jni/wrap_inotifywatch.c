#define __USE_GNU
typedef unsigned char bool;
#define false 0
#define true (!false)
#define MAX(a, b) ((a < b) ? (b) : (a))

#include "regex/regex.c"

#include "inotifywatch.c"
