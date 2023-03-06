#include <libasm.h>
#include <limits.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include "common.h"

int main()
{
	/* READ */
	{
		print_color("ft_read");

		int fds[2];
		char *alphabet = "abcdefghijklmnopqrstuvwxyz";
		if (pipe(fds))
			exit(1);
		write(fds[1], alphabet, 26);


		char buf[27];
		memset(buf, 0, sizeof(buf));

		assert(ft_read(fds[0], buf, 0),==,0);

		assert(ft_read(fds[0], buf, 5),==,5);
		assert(strncmp(buf, alphabet, 5),==,0);

		assert(ft_read(fds[0], buf, 23),==,21);
		assert(strncmp(buf, alphabet + 5, 21),==,0);

		assert(ft_read(5656, buf, 23),==,-1);
		assert(errno,==,EBADF);

		assert(ft_read(fds[0], NULL, -1),==,-1);
		assert(errno,==,EFAULT);
	}

	/* WRITE */
	{
		print_color("ft_write");

		int fds[2];
		char *alphabet = "abcdefghijklmnopqrstuvwxyz";
		if (pipe(fds))
			exit(1);

		char buf[27];
		memset(buf, 0, sizeof(buf));

		assert(ft_write(fds[1], alphabet, 0),==,0);

		assert(ft_write(fds[1], alphabet, 5),==,5);
		assert(read(fds[0], buf, 5),==,5);
		assert(strncmp(buf, alphabet, 5),==,0);

		assert(ft_write(5656, buf, 23),==,-1);
		assert(errno,==,EBADF);

		assert(ft_write(fds[1], NULL, -1),==,-1);
		assert(errno,==,EFAULT);
	}

	/* strlen */
	{
		print_color("ft_strlen");

		assert(ft_strlen(""),==,0);
		assert(ft_strlen("test"),==,4);
		assert(ft_strlen("test\0unreachable"),==,4);
	}

	/* strcmp */
	{
		print_color("ft_strcmp");

		assert(ft_strcmp("", ""),==,0);
		assert(ft_strcmp("lol", "lol"),==,0);
		assert(ft_strcmp("", "lol"),<,0);
		assert(ft_strcmp("lol", ""),>,0);
		assert(ft_strcmp("test", "te"),>,0);
		assert(ft_strcmp("te", "test"),<,0);
	}

	/* strcpy */
	{
		print_color("ft_strcpy");

		char buf[10];
		assert(ft_strcpy(buf, "lol"),==,buf);
		assert(strcmp(buf, "lol"),==,0);

		assert(ft_strcpy(buf, ""),==,buf);
		assert(strcmp(buf, ""),==,0);
	}

	/* strdup */
	{
		print_color("ft_strdup");

		{
			char *str;
			assert(strcmp((str = ft_strdup("houhou")), "houhou"),==,0);
			free(str);
		}
		{
			char *str;
			assert((str = ft_strdup("")),!=,NULL);
			assert(strcmp(str, ""),==,0);
			free(str);
		}
	}



	return (0);
}