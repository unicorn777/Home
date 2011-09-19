CC	= gcc
RM	= rm -rf
CFLAGS	= -W -Wall -ANSI -pedantic
LDFLAGS	= #-L. -L/usr/pkg/lib -lefence
NAME	= # FIXME
SOURCE	= # FIXME
OBJS	= $(SOURCE:.c=.o)
TODEL	= tags *~ .*.sw? \\\#*\\\# *.core

.PHONY: all clean fclean re

$(NAME): $(OBJS)
	$(CC) -o $(NAME) $(OBJS) $(LDFLAGS)

all: $(NAME)

.c.o:
	$(CC) $(CFLAGS) -c $<

clean:
	$(RM) $(OBJS) $(TODEL)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all
