NAME=fract_ol
CC=gcc
CFLAGS=-Wall -Wextra -Werror -I$(INC_DIR) -I$(LIB_DIR) -Ilibft/includes
LDFLAGS=-Llibft -lft -L$(LIB_DIR) -l$(LIB_DIR) -lXext -lX11 -lm -lz

OBJ_DIR=obj
SRC_DIR=src
INC_DIR=includes
LIB_DIR=mlx

_INC = fractol.h
INC = $(patsubst %, $(INC_DIR)/%, $(_INC))

_OBJ = fractol.o main.o
OBJ = $(patsubst %, $(OBJ_DIR)/%, $(_OBJ))

_LIB = libmlx.a
LIB = $(patsubst %, $(LIB_DIR)/%, $(_LIB))

all: $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INC)
	$(CC) -c -o $@ $< $(CFLAGS)

$(NAME): $(OBJ) $(LIB)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

$(LIB):
	cd $(LIB_DIR) && make && cd ..

.PHONY: clean

clean:
	rm -f $(OBJ_DIR)/*.o

fclean:
	rm -f $(OBJ_DIR)/*.o $(NAME)

re: fclean all