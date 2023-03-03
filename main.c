extern unsigned long ft_strlen(char *ptr);
extern char *ft_strcpy(char *dst, char *src);
extern int ft_strcmp(char *s1, char *s2);

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{
	char buf[1000];
		
	ft_strcpy(buf, argv[1]);
	printf("ft_strcmp(\"pa\", \"pal\") = %d\nft_strcmp(\"pal\", \"pa\") = %d\n", ft_strcmp("pallo", "pal"), ft_strcmp("pal", "pallo"));
	printf("strcmp(\"pa\", \"pal\") = %d\nstrcmp(\"pal\", \"pa\") = %d\n", strcmp("pallo", "pal"), strcmp("pal", "pa"));
	printf("testcmp: %d\n", ft_strcmp("pal", "pallo"));
	printf("testcmp: %d\n", ft_strcmp("dic", "dickinson"));
	printf("%s (len: %d, strcmp: %d)\n", buf, ft_strlen(argv[1]), ft_strcmp(buf, argv[1]));
}
