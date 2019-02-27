##
## EPITECH PROJECT, 2018
## deBruijn
## File description:
## Makefile for deBruijn.
##

NAME	=	deBruijn

all:
	make $(NAME)

$(NAME):
	stack build
	cp `stack path --local-install-root`/bin/$(NAME) .

.PHONY:	all $(NAME)
