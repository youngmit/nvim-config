set autoindent

let full_path = expand('%:p')

let path_list = split(full_path,'/')

if match(path_list,'mpact\c') > -1
  runtime f_mpact.vim
endif


