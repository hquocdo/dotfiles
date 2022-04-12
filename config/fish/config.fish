abbr -a yr 'cal -y'
abbr -a m make
abbr -a e vim
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'

if status is-interactive
    # Commands to run in interactive sessions can go here
    if ! set -q TMUX
        exec tmux
    end
end


if command -v exa > /dev/null
    abbr -a l 'exa'
    abbr -a ls 'exa'
    abbr -a ll 'exa -l'
    abbr -a lll 'exa -la'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

function ddg -d "search duckduckgo"
    open "https://duckduckgo.com/?q=$argv"
end

# Fish git prompt
#set __fish_git_prompt_showuntrackedfiles 'yes'
#set __fish_git_prompt_showdirtystate 'yes'
#set __fish_git_prompt_showstashstate ''
# set __fish_git_prompt_showupstream 'yes'
# set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (whoami)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

