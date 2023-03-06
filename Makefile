# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achansel <achansel@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/21 06:12:22 by achansel          #+#    #+#              #
#    Updated: 2023/03/06 13:59:06 by achansel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Toolchain, ld because lld can not output i386 elf
AS			= nasm
CC			= clang

# Set default arch to i386, override is allowed with env variable
NAME		= libasm.a
TNAME		= checker

# Flags
# TODO: FIX ON MACOS
ASFLAGS 	= -felf64
CCFLAGS		= -Wno-format

# Sources & Objects
TSRCS		=	src/check.c
ifdef BONUS
	TSRCS	=	src/check_bonus.c
endif

SRCS		=	libasm/src/ft_read.s \
				libasm/src/ft_strcmp.s \
				libasm/src/ft_strcpy.s \
				libasm/src/ft_strdup.s \
				libasm/src/ft_strlen.s \
				libasm/src/ft_write.s
SRCS_BONUS	=	libasm/src/ft_atoi_base_bonus.s \
				libasm/src/ft_list_push_front_bonus.s \
				libasm/src/ft_list_size_bonus.s

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

check:	all
	$(CC) $(CCFLAGS) $(TSRCS) -L./ -lasm -Ilibasm/include -o $(TNAME)

re:	fclean all

clean:
	rm -f $(OBJS_BONUS)
	rm -f $(OBJS)

fclean: clean
	rm -f $(TNAME)
	rm -f $(NAME)

.PHONY: all clean fclean re
