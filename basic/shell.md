## Shell basic
Bourne shell(sh), C shell(sch), Korn shell(ksh), Bourne-again shell(bash) etc.
- shell list: cat /etc/shells
- current shell: echo $shell
- change shell: cat /etc/passwd, chsh [shell name]

## Shell variable
- fname=abe
- echo $fname, set | grep fname
- unset fname

## Shell environment variable
- export varName=value
- echo $varName
- env | grep varName
- echo $PATH, $HOME, $USER, $SHELL

## Shell rules

### Quoting Rule
#### Metacharacters
\, ?, (), [], {}, $, *, % ...
ex: touch file{1..5}
- Backslash(\\)
- Double Quotes("") : except $, ''
- Single Quotes('') 

#### Nesting command
ex: echo "Today is $(date)", echo "Today is `date`", touch report-`date +%Y%m%d`_v1

#### alias
- register: alias name='command'
- check: alias or alias [name]
- delete: unalias [name]

#### prompt
\h host, \u user, \w absolute path, \W relative path, \d date, \t time, \$ prompt shape
echo $PS1,
- save PS1 or alias permanently, need to save ~/.bashrc file

#### Redirection
- communication channels

|channel|Redirection Characters|description|
|---|----|-----|
|STDIN| 0< , 0<<| input will be file |
|STDOUT| 1> , 1>>| output will be file |
|STDERR| 2> , 2>>| error will be files |

#### pipeline
command | command2 | commnad3  
ex: ls -l | wc -l
