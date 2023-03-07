/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   check_bonus.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: achansel <achansel@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/06 13:32:01 by achansel          #+#    #+#             */
/*   Updated: 2023/03/07 12:03:02 by achansel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <limits.h>
#include "common.h"

static t_list *list_new(void *data)
{
	t_list *new = malloc(sizeof(t_list));
	if (!new)
		exit(1);
	new->data = data;
	new->next = NULL;
	return (new);
}

static void list_addback(t_list **head, t_list *new)
{
	if (!(*head))
		*head = new;
	else
	{
		t_list *t;
		for (t = *head; t->next != NULL; t = t->next)
			;
		t->next = new;
	}
}

static t_list *build_list(int size, ...)
{
	va_list l;
	t_list	*new_list = NULL;

	va_start(l, size);
	for (int i = 0; i < size; i++)
		list_addback(&new_list, list_new(va_arg(l, void *)));
	va_end(l);
	return (new_list);
}

void check_sort(t_list *l, int (*cmp)(void *, void *))
{
	while (l->next)
	{
		assert(cmp(l->data, l->next->data),<=,0);
		l = l->next;			
	}
}

signed int list_intcmp(signed int a, signed int b)
{
	return ((signed int)(a - b));
}

int	list_strcmp(void *a, void *b)
{
	char *s1 = a;
	char *s2 = b;
	while (*s1 && *s2 && *s1 == *s2 && s1++ && s2++)
		;
	return (s1 - s2);
}

void stub_free(void *data)
{
	(void) data;
	return ;
}

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

	/* ft_list_size base tests */
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

	/* ft_remove_if base tests */
	print_color("ft_list_remove_if");
	{
		t_list *l1 = build_list(3, (void *) 1, (void *) 2, (void *) 3);
		t_list *l2 = build_list(3, (void *) 1, (void *) 2, (void *) 3);
		t_list *l3 = build_list(5, (void *) 1, (void *) 2, (void *) 2, (void *) 2, (void *) 3);
		t_list *l4 = build_list(3, (void *) 1, (void *) 1, (void *) 1);

		ft_list_remove_if(&l1, (void *) 3, list_intcmp, stub_free);
		assert(ft_list_size(l1),==,2);
		assert(l1->data,==,(void *) 1);
		assert(l1->next->data,==,(void *) 2);

		ft_list_remove_if(&l2, (void *) 1, list_intcmp, stub_free);
		assert(ft_list_size(l2),==,2);
		assert(l2->data,==,(void *)2);
		assert(l2->next->data,==,(void *)3);

		ft_list_remove_if(&l3, (void *) 2, list_intcmp, stub_free);
		assert(ft_list_size(l3),==,2);
		assert(l3->data,==,(void *)1);
		assert(l3->next->data,==,(void *)3);

		ft_list_remove_if(&l4, (void *) 1, list_intcmp, stub_free);
		assert(l4,==,NULL);
	}

	/* ft_list_sort base tests */
	print_color("ft_list_sort");
	{
		t_list *l1 = build_list(3, (void *) 3, (void *) 2, (void *) 1);
		t_list *l2 = build_list(3, (void *) 0, (void *) 36, (void *) -5);
		t_list *l3 = build_list(4, (void *) 1, (void *) 3, (void *) 2, (void *) 2);
		t_list *l4 = build_list(4, (void *) "everyone", (void *) "enjoys", (void *) "lexicographical", (void *) "comparaison");

		ft_list_sort(&l1, list_intcmp);
		assert(ft_list_size(l1),==,3);
		check_sort(l1, (void *) list_intcmp);

		ft_list_sort(&l2, list_intcmp);
		assert(ft_list_size(l2),==,3);
		check_sort(l2, (void *) list_intcmp);

		ft_list_sort(&l3, list_intcmp);
		assert(ft_list_size(l3),==,4);
		check_sort(l3, (void *) list_intcmp);

		ft_list_sort(&l4, list_strcmp);
		assert(ft_list_size(l4),==,4);
		check_sort(l4, (void *) list_strcmp);

	}
	return (0);
}
