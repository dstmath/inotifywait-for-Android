#ifndef _INOTIFYTOOLS_INOTIFY_H
#define _INOTIFYTOOLS_INOTIFY_H 1

#define SYS_INOTIFY_H_EXISTS_AND_WORKS 1


#ifdef SYS_INOTIFY_H_EXISTS_AND_WORKS
#include <sys/inotify.h>
#else
#include "inotify-nosys.h"
#endif // SYS_INOTIFY_H_EXISTS_AND_WORKS


#endif

