syn clear manReference
syn match manReference "\f\+([1-9][a-z]\=)"
syn match manReference "\f\+[-,‐]\n\s\+\f\+([1-9][a-z]\=)"

hi manReference term=bold cterm=bold ctermfg=141 guifg=#af87ff

syn match manTitle "^[A-Z][-:A-Z]\+([0-9]\+[a-z]\=).*"
syn match manSubHeading "^\s\{3\}\w.*$"
syn match manSectionHeading "^[A-Z][^(]\+\s.*$"

syn match manLink "\s\(\u[’'a-z]\+\s\)*\u[’'a-z]\+\[[1-9]\]"ms=s+1
syn match manLink "\<http://\S\+"

hi link manLink Underlined

syn clear manOptionDesc
syn clear manLongOptionDesc

syn match  manOptionDesc      "\(^\|[[{(/|, ]\)[+-]\w\+"ms=s+1
syn match  manLongOptionDesc  "\(^\|[[{(/|, ]\)--\(\[[^]]\+\]\)\?\w\(\w\|-\)\+"ms=s+1

hi manOptionDesc ctermfg=216 guifg=#ffaf87
hi link manLongOptionDesc manOptionDesc

if getline(1) =~ 'Perl'

  unlet b:current_syntax
  syn clear manReference
  syn include @perlCode vimruntime! syntax/perl.vim
  syn clear perlFunctionName
  syn region manSynopsis start="\v^(SYNOPSIS)"hs=s+8 end="^\u\+\s*$"me=e-12 keepend contains=manSectionHeading,@perlCode

elseif getline(1) =~ '^[a-zA-Z_]\+([23])'

  syntax include @cCode vimruntime! syntax/c.vim
  syn match manCFuncDefinition  display "\<\h\w*\>\s*("me=e-1 contained
  syn region manSynopsis start="\v^(SYNOPSIS|EXAMPLE)"hs=s+8 end="^\u.*$"me=e-12 keepend contains=manSectionHeading,@cCode,manCFuncDefinition

endif

runtime ftplugin/man.vim

set buftype=nofile
silent file $CUR_MANFILE
redraw!
