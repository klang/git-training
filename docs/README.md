Quick example, using git and a remote server, publishing some new features

## Git

In this demo, two project groups will implement 3 new features (p1 p2 and (awesome|amazing)-3) each.

- release v1.1 will consist of each groups p1 and p2 features (which are not added to the same file)
- release v1.2 will consist of (awesome|amazing)-3 from each group

If everything goes according to plan, each group will have to deal with conflicts at some point!


         .-p3------o----------+---o---.
         |                    |        \
         .-p2----o--.         |         \
         |           \        |          \
         .-p1--o--.   \       |           \
         |         \   \      |            \
         .-develop--+---+---. | .-----------+---.
         |                   \|/                 \
    -----o-master-------------+-------------------+ 
         ^                    ^                   ^
       v1.0                 v1.1                v1.2

## step by step

 - make a branch and introduce a change
 - make another branch and do the same
 - make yet another and publish that
 - merge the first two into develop
 - delete the merged branches
 - make a release
 - finish work on published branch
 - make another release
 - delete remote branch

## list of commands (12 .. that is all)

 - init
 - clone
 - add
 - status
 - commit
 - branch
 - checkout
 - merge
 - push
 - fetch
 - pull
 - log 

## oftent used

 - git fetch --all
 - git branch -a
 - git log develop ^origin/develop
 - git log origin/develop ^develop

## nice aliases

    git config --global alias.lol 'log --oneline --graph --all --decorate'
    git config --global alias.incoming 'log develop ^origin/develop'
    git config --global alias.outgoing 'log origin/develop ^develop'
    git config --global alias.unstage 'reset HEAD --'

## presenting yourself to git

    git config --global user.name "your name"
    git config --global user.email "your email"

or just for a project

    git config --local user.name "your name"
    git config --local user.email "your email"


## Link list

 - <http://ndpsoftware.com/git-cheatsheet.html>
 - <http://gitref.org/>
 - <http://try.github.io/>
 - <http://git-scm.com/book>

