# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: izperez <izperez@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/11 12:43:38 by izperez           #+#    #+#              #
#    Updated: 2024/01/26 10:36:04 by izperez          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_CLIENT = client
NAME_SERVER = server
CC = gcc
CFLAGS = -Wall -Werror -Wextra
INCLUDE = minitalk.h

LIBFT_DIR = libft/
LIBFT = $(LIBFT_DIR)libft.a

SERVER = server.c 
CLIENT = client.c

all: $(LIBFT) $(NAME_CLIENT) $(NAME_SERVER)

$(NAME_CLIENT): $(CLIENT)
		$(CC) $(CFLAGS) -o $(NAME_CLIENT) $(CLIENT) $(LIBFT)

$(NAME_SERVER): $(SERVER)
		$(CC) $(CFLAGS) -o $(NAME_SERVER) $(SERVER) $(LIBFT)
	
$(LIBFT):
		make -C $(LIBFT_DIR) all clean

clean:
		make -C $(LIBFT) fclean

flcean: clean
		rm -f $(NAME_CLIENT) $(NAME_SERVER)

re: flcean all

.PHONY: all clean fclean re $(LIBFT)

