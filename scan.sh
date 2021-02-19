#!/usr/bin/env bash

set -eo pipefail

# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# This script will locate and process all relevant files within the given git      #
# repository. Errors will be stored and a final exit status used to show if a      #
# failure occured during the processing.                                           #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Global Variables                                                                 #
# -------------------------------------------------------------------------------- #
# TEST_COMMAND - The command to execute to perform the test.                       #
# SEARCH_PATTERN - The pattern used by 'file' to match the correct file types.     #
# EXIT_VALUE - Used to store the script exit value - adjusted by the fail().       #
# -------------------------------------------------------------------------------- #
TEST_COMMAND='pycodestyle'
FILE_TYPE_SEARCH_PATTERN='^Python script'
FILE_NAME_SEARCH_PATTERN='\.py$'
EXIT_VALUE=0

BANNER="Scanning all python code with pycodestyle"

# -------------------------------------------------------------------------------- #
# Success                                                                          #
# -------------------------------------------------------------------------------- #
# Show the user that the processing of a specific file was successful.             #
# -------------------------------------------------------------------------------- #

function success()
{
    local message="${1:-}"

    if [[ -n "${message}" ]]; then
        printf ' [  \033[00;32mOK\033[0m  ] Processing successful for %s\n' "${message}"
    fi
}

# -------------------------------------------------------------------------------- #
# Fail                                                                             #
# -------------------------------------------------------------------------------- #
# Show the user that the processing of a specific file failed and adjust the       #
# EXIT_VALUE to record this.                                                       #
# -------------------------------------------------------------------------------- #

function fail()
{
    local message="${1:-}"
    local errors="${2:-}"

    if [[ -n "${message}" ]]; then
        printf ' [ \033[0;31mFAIL\033[0m ] Processing failed for %s\n' "${message}"
    fi

    if [[ -n "${errors}" ]]; then
        echo "${errors}"
    fi

    EXIT_VALUE=1
}

# -------------------------------------------------------------------------------- #
# Skip                                                                             #
# -------------------------------------------------------------------------------- #
# Show the user that the processing of a specific file was skipped.                #
# -------------------------------------------------------------------------------- #

function skip()
{
    local message="${1:-}"

    if [[ -n "${message}" ]]; then
        printf ' [ \033[00;36mSkip\033[0m ] Skipping %s\n' "${message}"
    fi
}

# -------------------------------------------------------------------------------- #
# Check                                                                            #
# -------------------------------------------------------------------------------- #
# Check a specific file.                                                           #
# -------------------------------------------------------------------------------- #

function check()
{
    local filename="$1"
    local errors

    if errors=$( ${TEST_COMMAND} "${filename}" 2>&1 ); then
        success "${filename}"
    else
        fail "${filename}" "${errors}"
    fi
}

# -------------------------------------------------------------------------------- #
# Scan Files                                                                       #
# -------------------------------------------------------------------------------- #
# Locate all of the relevant files within the repo and process compatible ones.    #
# -------------------------------------------------------------------------------- #

function scan_files()
{
    echo "${BANNER}"

    while IFS= read -r filename
    do
        if file -b "${filename}" | grep -qE "${FILE_TYPE_SEARCH_PATTERN}"; then
            check "${filename}"
        elif [[ "${filename}" =~ ${FILE_NAME_SEARCH_PATTERN} ]]; then
            check "${filename}"
        fi
    done < <(git ls-files | sort -V)

    exit $EXIT_VALUE
}

# -------------------------------------------------------------------------------- #
# Main()                                                                           #
# -------------------------------------------------------------------------------- #
# This is the actual 'script' and the functions/sub routines are called in order.  #
# -------------------------------------------------------------------------------- #

scan_files

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #
