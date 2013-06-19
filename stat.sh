#/bin/bash
 
function revisions() {
  git rev-list --all
}
 
function main() {
  revisions | while read revision
  do
    git diff $revision..$revision~1 --shortstat
  done
}
 
main
