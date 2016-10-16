##
## Makefile for asm lib c in /home/oliva_c/_workspace_asm
## 
## Made by Clement Oliva
## Login   <oliva_c@epitech.net>
## 
## Started on  Thu Mar 10 17:00:48 2016 Clement Oliva
## Last update Sat Mar 26 19:45:07 2016 Clement Oliva
##

NAME	=	libasm.so

SRC  	=	strlen.S \
		memset.S \
		strchr.S \
		memcpy.S \
		strcmp.S \
		strncmp.S \
		strcasecmp.S \
		rindex.S \
		strpbrk.S \
		strcspn.S

OBJ  	=	$(addprefix src/, $(SRC:.S=.o))

RM 	=	rm -f

ASM	=	nasm -f elf64

CFLAGS	=	-W -Wall -Wextra -Werror -fPIC -shared

all:		$(NAME)

%.o:		%.S
		$(ASM) -o $@ $<

$(NAME):	$(OBJ)
		gcc -o $(NAME) $(CFLAGS) $(OBJ)

clean:
		$(RM) $(OBJ)

fclean:			clean
		$(RM) $(NAME)

re:			fclean all
