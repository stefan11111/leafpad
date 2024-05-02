Leafpad, modified to use posix Make instead of bloated autotools and which build with -Wall -Wextra -Werror.
Due to how glib works, I can't also add -pedantic, because of function pointers being cast to void* by glib functions.
