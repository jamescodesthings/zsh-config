#!/usr/bin/env zsh

#USAGE=$(cat <<-END
#    This is line one.
#    This is line two.
#    This is line three.
#END
_gcmm_description="git commit -m wrapper with support for adding branch and project tags"
_gcmm_positional="message"
_gcmm_positional_desc="The commit message"
_gcmm_flag_names[1]="--help"
_gcmm_flag_messages[1]="shows help"
_gcmm_flag_names[2]="--set-project [project]"
_gcmm_flag_messages[2]="sets the branch's project to [project]"
_gcmm_flag_names[3]="--get-project"
_gcmm_flag_messages[3]="gets the branch's project"
_gcmm_flag_names[4]="--unset-project"
_gcmm_flag_messages[4]="unsets the branch's project"
_gcmm_flag_names[5]="--show"
_gcmm_flag_messages[5]="Shows the full tag that will be prepended to the [messsage]"

function _gcmm_set_project() {
  project=$1
  if is empty "$project"; then
    echo "$cs[error]No project passed to $c[reset]--set-project$cs[error], see --help for usage.$c[reset]"
    return 1
  fi

  branch=$(current_branch)


  if is empty "$branch"; then
    echo "$cs[error]Could not find current branch.$c[reset]"
    return 1
  fi

  git config branch.$branch.project $project
  echo "$cs[success]Set project for$c[reset] $branch $cs[success]to$c[reset] $project"
  return 0
}

function _gcmm_get_project() {
  branch=$(current_branch)

  if is empty "$branch"; then
    echo "$cs[error]Could not find current branch$c[reset]"
    return 1
  fi

  project=$(git config branch.$branch.project)
  if is empty "$project"; then
    echo "$cs[error]No project set for$c[reset] $branch"
  else
    echo "$project"
  fi;
  return 0;
}

function _gcmm_unset_project() {
  branch=$(current_branch)

  if is empty "$branch"; then
    echo "$cs[error]Could not find current branch$c[reset]"
    return 1
  fi

  git config --unset branch.$branch.project
  echo "$cs[success]Unset project for$c[reset] $branch"
  return 0
}


function _gcmm_show() {
  branch=$(current_branch)
  project=$(git config branch.$branch.project)
  issue=$(current_branch | egrep -o '[0-9]+')

  if is empty "$branch"; then
    echo "$cs[error]Could not find current branch$c[reset]"
    return 1
  fi

  if is not empty "$issue"; then
    tag="#$issue"
  fi

  if is not empty "$project"; then
    tag="$project$tag"
  fi

  echo $tag
  return 0
}

function _gcmm_commit() {
  local tag=$(_gcmm_show)
  local result=$?

  if is not equal $result 0; then
    echo "$tag"
    return 1
  fi

  git commit -m "$tag $1"
}

function gcmm () {
  local DEPS=(
    is
    git
    current_branch
  )

  if ! deps $DEPS; then
    return
  fi

  if is empty "$1" || has-flag '--help' $@; then
    print-help \
      "$0" \
      "$_gcmm_description" \
      "_gcmm_flag_names" \
      "_gcmm_flag_messages" \
      "$_gcmm_positional" \
      "$_gcmm_positional_desc"
    return 0
  fi

  if has-flag '--set-project' $@; then
    _gcmm_set_project $(flag-value '--set-project' $@)
    return $?
  fi

  if has-flag '--get-project' $@; then
    _gcmm_get_project
    return $?
  fi

  if has-flag '--unset-project' $@; then
    _gcmm_unset_project
    return $?
  fi

  if has-flag '--show' $@; then
    _gcmm_show
    return $?
  fi

  _gcmm_commit $1
}

gcmm "$@"
