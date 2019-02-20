##
## EPITECH PROJECT, 2018
## deBrujin
## File description:
## Makefile for deBrujin.
##

NAME	=	deBrujin

all:
	stack build
	cp `stack path --local-install-root`/bin/$(NAME) .

.PHONY:	all
