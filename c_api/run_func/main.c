#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#define FILENAME "func.lua"

void error (lua_State *L, const char *fmt, ...) {
	va_list argp;
	va_start(argp, fmt);
	vfprintf(stderr, fmt, argp);
	va_end(argp);
	lua_close(L);
	exit(EXIT_FAILURE);
}

/* call a function 'f' defined in Lua */
double f (lua_State *L, double x, double y) {
	double z;
	/* push functions and arguments */
	lua_getglobal(L, "f"); /* function to be called */
	lua_pushnumber(L, x); /* push 1st argument */
	lua_pushnumber(L, y); /* push 2nd argument */
	/* do the call (2 arguments, 1 result) */
	if (lua_pcall(L, 2, 1, 0) != 0)
		error(L, "error running function 'f': %s",
	lua_tostring(L, -1));
	/* retrieve result */
	if (!lua_isnumber(L, -1))
		error(L, "function 'f' must return a number");
	z = lua_tonumber(L, -1);
	lua_pop(L, 1); /* pop returned value */
	return z;
}



void main (int argc, char* argv[]) {
	
	double x = 12.4;
	double y = 121.5;
	lua_State *L = luaL_newstate(); /* opens Lua */
	luaL_openlibs(L); /* opens the standard libraries */
	
	if(luaL_loadfile(L, FILENAME) || lua_pcall(L, 0, 0, 0))
		error(L, "cannot run config. file: %s", lua_tostring(L, -1));
	printf("f(%f,%f)=%f",x,y,f(L,x,y));	
	
	lua_close(L);
	
}


