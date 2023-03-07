# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achansel <achansel@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/21 06:12:22 by achansel          #+#    #+#              #
#    Updated: 2023/03/07 12:14:51 by achansel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC			= clang
NAME		= checker

CFLAGS		= -Wno-format -Ilibasm/include

# Sources & Objects
SRCS		=	src/check.c
ifdef BONUS
	SRCS	=	src/check_bonus.c
endif

OBJS 		:=	$(addsuffix .o, $(basename $(SRCS)))

# Rules
all:		$(NAME)

bonus:
	@make BONUS=1

libasm/lib/libasm.a:
	@make -C libasm/

$(NAME): libasm/lib/libasm.a $(OBJS) 
	$(CC) $(CCFLAGS) $(OBJS) libasm/lib/libasm.a -o $(NAME)

re:	fclean all

clean:
	rm -f $(OBJS)
	make -C libasm/ clean


fclean: clean
	rm -f $(NAME)
	make -C libasm/ fclean

.PHONY: all clean fclean re
