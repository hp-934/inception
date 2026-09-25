# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yaepark <yaepark@student.codam.nl>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/06/05 13:02:47 by yaepark           #+#    #+#              #
#    Updated: 2026/09/25 15:59:46 by yaepark          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILES_TO_REMOVE =

.PHONY: all clean fclean re

all:
	docker build -t inception-nginx ./nginx
	docker build -t inception-mariadb ./mariadb

clean:

fclean: clean

re: fclean all