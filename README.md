# the basics

The first thing I do when I help people with `git`, is to have them introduce a few aliases.

## nice aliases

    git config --global alias.lol 'log --oneline --graph --all --decorate'
    git config --global alias.lols 'log --oneline --graph --all --decorate --branches --remotes --tags'
    git config --global alias.incomingd 'log --oneline --graph develop ^origin/develop'
    git config --global alias.outgoingd 'log --oneline --graph origin/develop ^develop'
    git config --global alias.outgoingm 'log --oneline --graph --decorate master ^origin/master'
    git config --global alias.incomingm 'log --oneline --graph --decorate origin/master ^master'
    git config --global alias.unstage 'reset --'

### colors are always nice

    git config --global color.ui auto
    
### for working in a linux/mac/windows mixed environment

    git config core.ignorecase false

## presenting yourself to git

    git config --global user.name "your name"
    git config --global user.email "your email"

or just for a project

    git config --local user.name "your name"
    git config --local user.email "your email"
    
## simpel fast config

    git config --global user.email "karstenlang@gmail.com"
    git config --global user.name "Karsten Lang Pedersen"
    git config --global alias.lol 'log --oneline --graph --all --decorate'
    git config --global alias.unstage 'reset --'
    git config --global color.ui auto
    git config core.ignorecase false
    
    echo "logs" > .gitignore
    git init; git add .; git commit -m 'initial'

## advanced aliases
    git config  --global alias.mylog '!git log --pretty=format:"%h%x09%an%x09%ad%x09%s" --author="$(git config user.name)"'
    git config --global alias.add-modified '!git ls-files --modified | xargs git add'
