/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: achansel <achansel@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/06 13:32:05 by achansel          #+#    #+#             */
/*   Updated: 2023/03/07 10:25:41 by achansel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

// size_t
#include <stddef.h>
// ssize_t
#include <unistd.h>

// mandatory
extern size_t		ft_strlen(const char *s);
extern char			*ft_strcpy(char *restrict dst, const char *restrict src);
extern int			ft_strcmp(const char *s1, const char *s2);
extern char			*ft_strdup(const char *s);
extern ssize_t 		ft_write(int fd, const void *buf, size_t count);
extern ssize_t 		ft_read(int fd, void *buf, size_t count);

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

// bonus
extern int			ft_atoi_base(char *str, char *base);
extern int			ft_list_size(t_list *head);
extern void 		ft_list_push_front(t_list **begin_list, void *data);
extern void 		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
extern void			ft_list_sort(t_list **begin_list, int (*cmp)());