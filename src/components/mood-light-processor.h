/* word-clock: a flexible ambilight clone for embedded linux
*  Copyright (C) 2013 Georg Kaindl
*  
*  This file is part of word-clock.
*  
*  word-clock is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 2 of the License, or
*  (at your option) any later version.
*  
*  word-clock is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*  
*  You should have received a copy of the GNU General Public License
*  along with word-clock.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __WORDCLOCK_MOOD_LIGHT_PROCESSOR_H__
#define __WORDCLOCK_MOOD_LIGHT_PROCESSOR_H__

#include "../component.h"

struct wordclock_processor_component*
wordclock_mood_light_processor_create(const char* name, int argc, char** argv);

#endif // __WORDCLOCK_MOOD_LIGHT_PROCESSOR_H__
