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

NAME		= checker
ifdef BONUS
	NAME 	= checker_bonus
endif

CFLAGS		= -Wno-format -Ilibasm/include

# Sources & Objects
SRCS		=	src/check.c
ifdef BONUS
	SRCS	=	src/check_bonus.c
endif

OBJS 		:=	$(addsuffix .o, $(basename $(SRCS)))

# Rules
all:		libasm  $(NAME)

bonus:
	@make BONUS=1

libasm:
	@make -C libasm/

$(NAME): libasm/lib/libasm.a $(OBJS) 
	$(CC) $(CCFLAGS) $(OBJS) libasm/lib/libasm.a -o $(NAME)

re:	fclean all

clean:
ifndef BONUS
	@make BONUS=1 clean
	make -C libasm/ clean
endif
	rm -f $(OBJS)


fclean: clean
ifndef BONUS
	@make BONUS=1 fclean
	make -C libasm/ fclean
endif
	rm -f $(NAME)

.PHONY: all clean fclean re libasm
