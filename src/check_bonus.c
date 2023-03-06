/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   check_bonus.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: achansel <achansel@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/06 13:32:01 by achansel          #+#    #+#             */
/*   Updated: 2023/03/06 14:17:23 by achansel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

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

	/* ft_push_front base tests */
	print_color("ft_list_push_front");
	{
		t_list *head = NULL;

		ft_list_push_front(&head, (void *) 0xBEEF);
		assert(head,!=,NULL);
		assert(head->data,==,(void *) 0xBEEF);
		assert(head->next,==,NULL);

		t_list *old_first = head;
		ft_list_push_front(&head, (void *) 0xCAFE);
		assert(head,!=,NULL);
		assert(head->data,==,(void *) 0xCAFE);
		assert(head->next,==,old_first);
		assert(head->next->data,==,(void *) 0xBEEF);
		assert(head->next->next,==,NULL);

	}


	print_color("ft_list_size");
	{
		t_list *head = NULL;

		assert(ft_list_size(NULL),==,0);
		ft_list_push_front(&head, (void *) 0xBEEF);
		assert(ft_list_size(head),==,1);
		ft_list_push_front(&head, (void *) 0xCAFE);
		assert(ft_list_size(head),==,2);
		head->next = NULL;
		assert(ft_list_size(head),==,1);
	}


	return (0);
}