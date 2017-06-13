#pragma once

#ifdef GOODTIME_EXPORTS
#define GOODTIME_API declspec(dllexport)
#else
#define GOODTIME_API declspec(dllimport)
#endif

#inclib "GoodTime"

declare function getMilliseconds() as long
