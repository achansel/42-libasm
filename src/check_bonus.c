#include <libasm.h>
#include <limits.h>
#include "common.h"

int main()
{

	/* atoi base tests */
	print_color("ft_atoi_base");

	assert(ft_atoi_base("-----", "0123456789"),==,0);
	assert(ft_atoi_base("-+++--", "0123456789"),==,0);
	assert(ft_atoi_base("    +-0", "0123456789"),==,0);

	assert(ft_atoi_base("123", "01123456789"),==,0);
	assert(ft_atoi_base("123", "0 5"),==,0);
	assert(ft_atoi_base("123", "0123456789 "),==,0);

	assert(ft_atoi_base("123", "0123456789"),==,123);
	assert(ft_atoi_base("deadbeef", "0123456789abcdef"),==,(int) 0xdeadbeef);
	assert(ft_atoi_base("1000", "01"),==,8);
	assert(ft_atoi_base("042", "01234567"),==,042);

	assert(ft_atoi_base(" 2147483647", "0123456789"),==,2147483647);
	assert(ft_atoi_base("-2147483648", "0123456789"),==,-2147483648);

	return (0);
}