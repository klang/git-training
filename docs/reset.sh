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
cp docs/template.txt amazing.txt

cp ../*.md docs
cp ../reset.sh docs

echo -e "v1.0" > VERSION
git init
git add .
git commit -m 'initial'
git branch develop
git tag -a v1.0 -m "v1.0"

git remote add origin ../$REPO
git push -u origin --all
git push --tags origin

cd ..

rm -rf project-group-amazing
rm -rf project-group-awesome

git clone $REPO project-group-amazing
git clone $REPO project-group-awesome


