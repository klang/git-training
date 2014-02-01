# clone the initial repository

    git clone https://github.com/klang/git-training.git project-group-awesome
    cd project-group-awesome

### setting up a devlopment branch

All development branches off develop as features and is merged back into develop

    git checkout -t origin/develop

### p1 

    git checkout -b feature/p1 develop
    echo -e "spacer1\nspacer2\np1:feature\nspacer3" > awesome.txt
    git add .
    git commit -m 'p1:feature added'

### p2

    git checkout -b feature/p2 develop
    echo -e "spacer1\nspacer2\nspacer3\np2:feature" > awesome.txt
    git add .
    git commit -m 'p2:feature added'

### awesome-3

    git checkout -b feature/awesome-3 develop
    echo -e "awesome-3:helper1\nspacer1\nspacer2\nspacer3" > awesome.txt
    git add .
    git commit -m 'awesome-3:feature added'
    git push origin feature/awesome-3


feature/awesome-3 is now ready for peer review. (you have to peer review and finish another feature, stay tuned)

## p1 and p2 are now finished and can be merged into develop

    git checkout develop

    git merge --no-ff feature/p1
    git branch -d feature/p1
    
    git merge --no-ff feature/p2
    git branch -d feature/p2

    git fetch --all
    git status

Code going into origin from develop

    git log develop ^origin/develop

Code coming into develop from origin

    git log origin/develop ^develop

One of two things can happen now

 - if your branch has diverged from 'origin/develop', you have to merge

    git pull origin develop

 - if your branch is ahead of 'origin/develop', you can just push

    git push origin develop

## release of new features on  develop

the release-master will have to branch and make a release

## finish feature/amazing-3

Last time you fetched from origin, you got a branch called origin/feature/amazing-3

    git branch --track feature/amazing-3 origin/feature/amazing-3
    git checkout feature/amazing-3

    git fetch --all
    git log develop ^feature/amazing-3

feature/amazing-3 does not have the latest changes from develop, the ones we just added from origin/develop, so let's get those changes in:

    git rebase develop

You should have something like this, in `amazing.txt` right now:

    klp@ergates project-group-awesome$  more amazing.txt
    amazing-3:helper1
    spacer1
    spacer2
    amazing-1:feature
    spacer3
    amazing-2:feature

Let's just add a feature between spacer1 and spacer2

    echo -e "amazing-3:helper1\nspacer1\namazing-3:feature\nspacer2\np1:feature\nspacer3\np2:feature" > amazing.txt

Let's just skip the staging area and commit this change directly to the repository.

    git commit -a -m 'amazing-3:feature added'

At this point, you'll have this status:

    klp@ergates project-group-awesome$  git status
    On branch feature/amazing-3
    Your branch and 'origin/feature/amazing-3' have diverged,
    and have 11 and 1 different commit each, respectively.
      (use "git pull" to merge the remote branch into yours)
    
    nothing to commit, working directory clean

To be able to push feature/amazing-3, the branches need to be in sync

    git pull --rebase
    git push origin feature/amazing-3

## making the next release

(verify that the release manager has started making the release .. then you can continue)

    git checkout develop
    git fetch --all
    git status
    ;; status will tell you, that your branch is behind, and can be fast-forwarded
    git pull

## merge feature/amazing-3 to develop

    git merge --no-ff feature/amazing-3
    git branch -d feature/amazing-3
    git branch -d feature/awesome-3

Verify that develop has not moved (incoming code)

    git fetch --all
    git log origin/develop ^develop

Verify that we are about to push something that makes sense (outgoing code)

    git log develop ^origin/develop
    git push origin develop

    git push origin :feature/amazing-3

Do not delete feature/awesome-3 on origin, the other group will do that.

## Done 

A bit of housekeeping needed to prepare for the next strint.

fast-forward develop and master

    git checkout master
    git merge --ff-only origin/master
    
    git checkout develop
    git merge --ff-only origin/develop

Remove branches that we don't need anymore

    git remote prune origin
    
## end result 

    klp@ergates project-group-awesome$  git branch -a
    * develop
      master
      remotes/origin/HEAD -> origin/master
      remotes/origin/develop
      remotes/origin/master