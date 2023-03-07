# LIBASM
[![Generic badge](https://img.shields.io/static/v1?label=Skills&message=C%2C%20Assembly%2C%20Linked%20Lists&color=red&style=for-the-badge)](https://shields.io/)
#### This project is all about getting the basics of x86 assembly programming, by reimplementing a few libc and linked lists functions.

In order to prove that the functions work, we also have to write basic [unit tests](src/).

## Functions
### Mandatory
- [ft_strlen](libasm/src/ft_strlen.s) - *man 3 strlen*
- [ft_strcpy](libasm/src/ft_strcpy.s) - *man 3 strcpy*
- [ft_strcmp](libasm/src/ft_strcmp.s) - *man 3 strcmp*
- [ft_write](libasm/src/ft_write.s) - *man 2 write*
- [ft_read](libasm/src/ft_read.s) - *man 2 read*
- [ft_strdup](libasm/src/ft_strdup.s) - *man 3 strdup*

### Bonus
- [ft_atoi_base](libasm/src/ft_atoi_base_bonus.s) - *int ft_atoi_base(char \*str, char \*base);*
- [ft_list_push_front](libasm/src/ft_list_push_front_bonus.s) - *void ft_list_push_front(t_list \*\*, void \*data);*
- [ft_list_size](libasm/src/ft_list_size_bonus.s) - *int ft_list_size(t_list \*);*
- [ft_list_sort](libasm/src/ft_list_sort_bonus.s) - *void ft_list_sort(t_list \*\*, int (\*cmp)());*
- [ft_list_remove_if](libasm/src/ft_list_remove_if_bonus.s) - *void ft_list_remove_if(t_list \*\*, void \*data_ref, int (\*cmp)(void \*,void \*), void (\*free_fn)(void \*));*

The `t_list` struct can be found in the [include file](libasm/include/libasm.h) of the library.


## Useful docs
- [x64 Assembly](https://www.inf.usi.ch/faculty/soule/teaching/2015-fall/cc/x64-intro.pdf)
- [System V ABI](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)
- [Data structures in memory](https://en.wikibooks.org/wiki/X86_Disassembly/Data_Structures)
