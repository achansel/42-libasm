# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achansel <achansel@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/21 06:12:22 by achansel          #+#    #+#              #
#    Updated: 2023/03/07 12:12:00 by achansel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

AS			= nasm

NAME		= lib/libasm.a

ASFLAGS 	= -fmacho64

# Sources & Objects
SRCS		=	src/ft_read.s \
				src/ft_strcmp.s \
				src/ft_strcpy.s \
				src/ft_strdup.s \
				src/ft_strlen.s \
				src/ft_write.s
SRCS_BONUS	=	src/ft_atoi_base_bonus.s \
				src/ft_list_push_front_bonus.s \
				src/ft_list_size_bonus.s \
				src/ft_list_remove_if_bonus.s \
				src/ft_list_sort_bonus.s

OBJS 		:=	$(addsuffix .o, $(basename $(SRCS)))
OBJS_BONUS	:=  $(addsuffix .o, $(basename $(SRCS_BONUS)))

ifdef BONUS
	OBJS	+=	$(OBJS_BONUS)
endif

# Rules
all:		$(NAME)

bonus:
	@make BONUS=1

$(NAME):	$(OBJS)
	ar rcs $(NAME) $(OBJS)

re:	fclean all

clean:
	rm -f $(OBJS_BONUS)
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

.PHONY: all clean fclean re
