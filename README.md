# public-dotfiles

# Install font

```bash
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
```

# Vim basics 

Command     |   Info
------------|-------------
:!ls    |   Execute a Command
:w test |   Save the file
v :w test   |   Save the selection to a file
:r test |   Read a file and insert it
:r !ls  |   Insert the output of the command
\<CTRL> g   |   Display file status
G   |   Move to the end of the file
100G    |   Move to line 100
gg  |   Move to the first line
\<CTRL> a   |   Incrementa valor numerico
\<CTRL> x   |   Decrementa valor numerico
s   |   Replace and Insert mode


Insert mode | Info
------------|----------
\<CTRL>t    |   ">>" Do modo normal
\<CTRL>d    |   "<<" Do modo normal
\<CTRL>a    |   Insert last text
\<CTRL>n    |   AutoComplete
\<CTRL>y    |   Copy char on upper line
\<CTRL>h    |   Left
\<CTRL>l|   Right
\<CTRL>j    |   Down
\<CTRL>k    |   Up
\<CTRL>i|   Tab
\<CTRL>e    |   Copy char on lower line
\<CTRL>w    |   Delete last word
\<CTRL>u|   Delete until the start of the line
\<CTRL>o    |   Execute one command from normal mode
\<CTRL>xe   |   Scroll


# Nvim basics

| General | Info |
| -------| ---------|
|\<SPACE>ch	    |  Open the buildin cheatsheet|
|:vsp			|Vertical Split|
|:sp			|Horizontal Split|
|\<CTRL>k		|GoUP|
|\<CTRL>j		|Go Down|
|\<CTRL>l		|Go Rigth|
|\<CTRL>h		|Go Left|
|\<SPACE>v		|Open a vertical TERM| 
|\<SPACE>h		|Open a horizontal TERM|
|\<SHIFT>v `:! tr -s " " \| column -t -s '\|' -o '\|'` |  Format md tables |
***
| FileTree | Info |
| -------| ---------|
| \<CTRL>n |Open the FileTree | 
| m         | Mark a file | 
| a         | Create a file |
| c         | Copy | 
| p         | Paste | 
| r         | Rename  |
| \<space>e  | Focus the window |
***

| Tabbufline | Info |
| -------| ---------|
| \<TAB> | Go forward on tabs | 
| \<SHIFT>\<TAB> | Go back |
| \<Space>x     | DELETE Current tab | 

*** 
## Install syntax highlight for new language
`:TSInstall <language_to_install>`

