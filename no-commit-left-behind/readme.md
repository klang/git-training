          .--f1--o--o--
         /
    ----o--master----o---


rebase laver nye commits for ændringer på f1.
de oprindelige commits bliver garbage collected "på et tidspunkt"


          .--o--o--    .--f1--o--o--
         /            /
    ----o--master----o---


push til origin fra en anden udvikler, før force push, vil opdatere den gamle f1, dén branch som denne udvikler ser. 

          .--o--o--o-  .--f1--o--o--
         /            /
    ----o--master----o---


efter force push, vil denne udviler være lidt forvirret, men heldigvis kan commit fiskes frem fra reflog og sættes ind det rigtige sted. (af den anden udvilker)


run 

    ./reset.sh 
    
in a new directory

in one shell, go to project-group-force-pusher


    git pull origin master --rebase

    # resolve conflicts

at this point, git status will tell you to pull, but fast-forward is not possible .. 
(google suggest some ways to fix this)

so .. we force push

and we are rejected .. 

.. so, is git smart enough to detect that this is wrong?

in another shell, before pushing anything in the first shell, go to project-group-pusher

    echo "maybe lost commit" >> amazing.txt
    git -c commit.gpgsign=false commit -m 'pusher has made a change'
    git push
  
