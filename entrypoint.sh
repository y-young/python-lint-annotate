#!/bin/sh -l

# Parameters
#
# $1 - python-root-list
# $2 - use-pylint
# $3 - use-pycodestyle
# $4 - use-flake8
# $5 - use-black
# $6 - use-mypy
# $7 - use-isort
# $8 - use-vulture
# $9 - extra-pylint-options
# ${10} - extra-pycodestyle-options
# ${11} - extra-flake8-options
# ${12} - extra-black-options
# ${13} - extra-mypy-options
# ${14} - extra-isort-options
# ${15} - extra-vulture-options

cp /code/flake8.json /github/workflow/flake8.json
cp /code/mypy.json /github/workflow/mypy.json
cp /code/pylint-error.json /github/workflow/pylint-error.json
cp /code/pylint-warning.json /github/workflow/pylint-warning.json
cp /code/vulture.json /github/workflow/vulture.json
echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/flake8.json"
echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/mypy.json"
echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/pylint-error.json"
echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/pylint-warning.json"
echo "::add-matcher::${RUNNER_TEMP}/_github_workflow/vulture.json"

if [ "$2" = true ] ; then

    echo Running: pylint $9 $1

    pylint $9 $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
    fi

fi


if [ "$3" = true ] ; then

    echo Running: pycodestyle ${10} $1

    pycodestyle ${10} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
    fi

fi

if [ "$4" = true ] ; then

    echo Running: flake8 ${11} $1

    flake8 ${11} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
    fi

fi

if [ "$5" = true ] ; then

    echo Running: black --check ${12} $1

    black --check ${12} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
    fi

fi

if [ "$6" = true ] ; then

    echo Running: mypy ${13} $1

    mypy ${13} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
    fi

fi

if [ "$7" = true ] ; then

    echo Running: isort ${14} $1 -c --diff

    isort ${14} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
    fi

fi

if [ "$8" = true ] ; then

    echo Running: vulture ${15} $1

    vulture ${15} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "vulture ok"
    else
        echo "vulture error"
    fi

fi
