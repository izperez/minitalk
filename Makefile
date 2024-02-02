# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: izperez <izperez@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/11 12:43:38 by izperez           #+#    #+#              #
#    Updated: 2024/02/02 11:24:40 by izperez          ###   ########.fr        #
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

NAME_CLIENT_BONUS = client_bonus
NAME_SERVER_BONUS = server_bonus


all: $(LIBFT) $(NAME_CLIENT) $(NAME_SERVER)
$(NAME_CLIENT): $(CLIENT)
		$(CC) $(CFLAGS) -o $(NAME_CLIENT) $(CLIENT) $(LIBFT)

$(NAME_SERVER): $(SERVER)
		$(CC) $(CFLAGS) -o $(NAME_SERVER) $(SERVER) $(LIBFT)
	
$(LIBFT):
		make -C $(LIBFT_DIR) all clean

clean:
		make -C $(LIBFT_DIR) fclean

fclean: clean
		rm -f $(NAME_CLIENT) $(NAME_SERVER)

re: fclean all

.PHONY: all clean fclean re $(LIBFT)

