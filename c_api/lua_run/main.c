#include <stdio.h>
#include <string.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

void main (int argc, char* argv[]) {
	char buff[1024];
	int error;
	FILE* file = NULL;
	lua_State *L = luaL_newstate(); /* opens Lua */
	luaL_openlibs(L); /* opens the standard libraries */
	if (argc < 2){
		printf("Usage: %s <lua_script_file>", argv[0]);
		lua_close(L);
		return;
	}
	if((file = fopen(argv[1], "r")) == NULL){
		printf("Can't open file %s", argv[1]);
		lua_close(L);
		return;
	}
	while (fgets(buff, sizeof(buff), file) != NULL) {
		error = luaL_loadbuffer(L, buff, strlen(buff), "line") || lua_pcall(L, 0, 0, 0);
		
		if (error) {
			fprintf(stderr, "%s", lua_tostring(L, -1));
			lua_pop(L, 1); /* pop error message from the stack */
		}
	}
	lua_close(L);
	fclose(file);
}