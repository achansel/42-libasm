#pragma once

// size_t
#include <stddef.h>
// ssize_t
#include <unistd.h>

// mandatory
extern size_t		ft_strlen(const char *s);
extern char			*ft_strcpy(char *restrict dst, const char *restrict src);
extern int			ft_strcmp(const char *s1, const char *s2);
extern char			*ft_strdup(const char *s);
extern ssize_t 		ft_write(int fd, const void *buf, size_t count);
extern ssize_t 		ft_read(int fd, void *buf, size_t count);

// bonus
extern int			ft_atoi_base(char *str, char *base);