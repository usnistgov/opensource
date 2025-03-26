#!/bin/bash
# Run this script to refresh all data for today

exec &> >(tee ../LAST_MASTER_UPDATE.log)

export GITHUB_DATA=../../explore/github-data
DATELOG=../LAST_MASTER_UPDATE.txt

# On exit
function finish {
    # Log end time
    echo -e "END\t$(date -u)" >> $DATELOG
}
trap finish EXIT

# Stop and Log for failed scripts
function errorCheck() {
    if [ $ret -ne 0 ]; then
        echo "FAILED - $1"
        echo -e "FAILED\t$1" >> $DATELOG
        exit 1
    fi
}

# Basic script run procedure
function runScript() {
    echo "Run - $1"
    python -u $1
    ret=$?
    errorCheck "$1"
}


echo "RUNNING MASTER UPDATE SCRIPT"

# Log start time
echo -e "$(date -u '+%F-%H')" > $DATELOG
echo -e "START\t$(date -u)" >> $DATELOG


# RUN THIS FIRST
runScript cleanup_inputs.py &
cleanup_inputs=$!

# --- BASIC DATA ---
# Required before any other repo scripts (output used as repo list)
runScript get_repos_info.py &
get_repos_info=$!

# Required before any other member scripts (output used as member list)
runScript get_nist_members.py &
get_nist_members=$!

# --- EXTERNAL V INTERNAL ---
runScript get_members_extrepos.py &
get_members_extrepos=$!

runScript get_repos_users.py &
get_repos_users=$!

# --- ADDITIONAL REPO DETAILS ---
runScript get_repos_languages.py &
get_repos_languages=$!

runScript get_repos_topics.py &
get_repos_topics=$!

runScript get_repos_activitycommits.py &
get_repos_activitycommits=$!

runScript get_repos_activitylines.py &
get_repos_activitylines=$!

runScript get_repos_dependencies.py &
get_repos_dependencies=$!


# --- HISTORY FOR ALL TIME ---
runScript get_repos_creationhistory.py &
get_repos_creationhistory=$!


# RUN THIS LAST
runScript build_yearlist.py &  # Used in case of long term cumulative data
build_yearlist=$!

runScript gather_repo_metadata.py &  # Generate simplified metadata file
gather_repo_metadata=$!

wait $cleanup_inputs $get_repos_info $get_nist_members $get_members_extrepos $get_repos_users $get_repos_languages $get_repos_topics $get_repos_activitycommits $get_repos_activitylines $get_repos_dependencies $get_repos_creationhistory $build_yearlist $gather_repo_metadata

echo "MASTER UPDATE COMPLETE"
