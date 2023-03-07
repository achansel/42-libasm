/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   common.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: achansel <achansel@student.42nice.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/06 13:32:03 by achansel          #+#    #+#             */
/*   Updated: 2023/03/06 13:32:03 by achansel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#pragma once

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdarg.h>

#define assert(a, op, b) \
{ \
	if (a op b) printf("\033[1m\033[32mOK:\033[0m " #a " " #op " " #b "\n"); \
	else \
	{ \
		printf("\033[1m\033[31mERROR:\033[0m " #a " = %ld, expected " #op " " #b " \033[1m\033[90m(%s:%d)\033[0m\n", a, __FILE__, __LINE__); \
		exit(1); \
	} \
}

static inline void print_color(char *fun)
{
	printf("\n\033[1mTesting: \033[0m\033[35m%s\033[0m...\n", fun);
}
