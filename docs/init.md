### working directory for setup

    mkdir lean
    cd lean

### initial setup for the demo

    mkdir -p initial-setup/docs
    cd initial-setup
    echo -e "spacer1\nspacer2\nspacer3" > docs/template.txt
    cp docs/template.txt awesome.txt
    cp docs/template.txt amazing.txt
    
    echo -e "v1.0" > VERSION
    git init
    git add .
    git commit -m 'initial'
    git branch develop
    git tag -a v1.0 -m "v1.0"

    # create project on github
    git remote add origin https://github.com/klang/git-training-lean.git
    git push -u origin --all
    git push --tags origin
