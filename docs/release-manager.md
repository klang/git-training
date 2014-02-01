http://ndpsoftware.com/git-cheatsheet.html

# set up release manager repository

    git clone https://github.com/klang/git-training-lean.git release-manager
    cd release-manager

    git config --local user.name "release-manager"
    git config --local user.email ""

    git branch --track develop origin/develop
    git checkout develop

# prepare release v1.1

    git branch release/v1.1 

develop is now free to recieve new changes. Last minute changes can be made to the release.

    git checkout release/v1.1 
    echo "v1.1" > VERSION
    git add VERSION
    git commit -m "version bumbed to 1.1" VERSION

expected contents:

    klp@ergates initial-setup$  more amazing.txt
    spacer1
    spacer2
    p1:feature
    spacer3
    p2:feature
    klp@ergates initial-setup$  more awesome.txt
    spacer1
    spacer2
    p1:feature
    spacer3
    p2:feature
    
Merge into master

    git checkout master
    git fetch origin master
    git merge --no-ff release/v1.1
    git tag -a v1.1 -m "v1.1"
    git push origin master
    git push --tags

Merge back into develop

    git checkout develop
    git fetch origin develop
    git merge --no-ff release/v1.1
    git push origin develop
    git branch –d release/v1.1
    
# prepare release v1.2

    git branch release/v1.2

develop is now free to recieve new changes. Last minute changes can be made to the release.

    git checkout release/v1.2 
    echo "v1.2" > VERSION
    git add VERSION
    git commit -m "version bumbed to 1.2" VERSION

expected contents:

    klp@ergates release-manager$  more amazing.txt
    amazing-3:helper1
    spacer1
    amazing-3:feature
    spacer2
    amazing-1:feature
    spacer3
    amazing-2:feature
    klp@ergates release-manager$  more awesome.txt
    awesome-3:helper1
    spacer1
    awesome-3:feature
    spacer2
    awesome-1:feature
    spacer3
    awesome-2:feature

Merge into master

    git checkout master
    git fetch origin master
    git merge --no-ff release/v1.2
    git tag -a v1.2 -m "v1.2"
    git push origin master
    git push --tags

Merge back into develop

    git checkout develop
    git fetch origin develop
    git merge --no-ff release/v1.2
    git push origin develop
    git branch -d release/v1.2
  