##
## EPITECH PROJECT, 2018
## makefile
## File description:
## 
##

NAME		= libasm.so

ASMFLAGS	= -f elf64 -F dwarf

SRC		= src/strlen.asm \
		src/rindex.asm \
		src/strcmp.asm \
		src/strcspn.asm \
		src/strncmp.asm \
		src/strchr.asm \
		src/memcpy.asm \
		src/memset.asm \
		src/memmove.asm \
		src/strcasecmp.asm \
		src/strpbrk.asm \

OBJ		= $(SRC:.asm=.o)

%.o: %.asm
	nasm $(ASMFLAGS) -o $@ $<

$(NAME)	: $(OBJ)
	ld -shared -o $(NAME) $(OBJ)

all	: $(NAME)

clean	:
	rm -rf $(OBJ)

fclean	: clean
	rm -rf $(NAME)

re	: fclean all

debug	:	ASMFLAGS += -g
debug	:	all

redebug	:	fclean debug
