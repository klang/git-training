REPO=repo/git-training

rm -rf repo
mkdir repo
cd repo
git init --bare --shared git-training
cd ..

rm -rf initial-setup
mkdir -p initial-setup/docs
cd initial-setup
echo -e "spacer1\nspacer2\nspacer3" > docs/template.txt
cp docs/template.txt awesome.txt
cp ../*.md docs
cp ../reset.sh docs

git init
git add .
git -c commit.gpgsign=false commit -m 'initial'
git checkout -b feature/p1
echo -e "spacer1\nspacer2\np1:feature1\nspacer3" > amazing.txt
git add .
git -c commit.gpgsign=false commit -m 'p1:feature1 added'
echo -e "spacer1\nspacer2\np1:feature1\np1:feature2\nspacer3" > amazing.txt
git add .
git -c commit.gpgsign=false commit -m 'p1:feature2 added'
git checkout master
echo -e "spacer1\nmaster\nspacer2\nspacer3" > amazing.txt
git add .
git -c commit.gpgsign=false commit -m 'something merged to master'

git remote add origin ../$REPO
git push -u origin --all

cd ..

rm -rf project-group-force-pusher
rm -rf project-group-pusher

git clone $REPO project-group-force-pusher
cd project-group-force-pusher
git checkout -b feature/p1 origin/feature/p1
cd ..
git clone $REPO project-group-pusher
cd project-group-pusher
git checkout -b feature/p1 origin/feature/p1
cd ..


