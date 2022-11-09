# What's behind a git-checkout?

```yaml
git init
git remote add origin "https://$GITHUB_ACTOR:${{secrets.GITHUB_TOKEN}}@github.com/$GITHUB_REPOSITORY.git

git config --global user.email "my@mail.com"
git config --global user.name  "My Name"
```

git fetch
git checkout master
git branch --set-upstream-to=origin/master
git pull

ls -a

## Now do something with the repo

echo $RANDOM >> random.txt

ls -a

git add -A
git commit -m"Random File"
git push
