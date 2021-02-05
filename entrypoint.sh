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
# $10 - extra-pydocstyle-options
# ${11} - extra-pycodestyle-options
# ${12} - extra-flake8-options
# ${13} - extra-black-options
# ${14} - extra-mypy-options
# ${15} - extra-isort-options
# ${16} - extra-vulture-options
# ${17} - extra-pydocstyle-options

# for docker
#cp /*.json .

echo $1
echo $2
echo $3
echo $4
echo $5
echo $6
echo $7
echo $8
echo $9
echo $11
echo $12
echo $13
echo $14
echo $15
echo $16
echo $17

for matcher in ./*.json
do
    echo adding matcher $matcher
    echo "::add-matcher::${matcher}"
done
echo "TERM: changing from $TERM -> xterm"
export TERM=xterm

if [ "$2" = true ] ; then

    echo Running: pylint $9 $1

    $CONDA/bin/pylint --output-format="colorized" $9 $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
    fi

fi


if [ "$3" = true ] ; then

    echo Running: pycodestyle ${11} $1

    $CONDA/bin/pycodestyle ${11} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
    fi

fi

if [ "$4" = true ] ; then

    echo Running: flake8 ${12} $1

    $CONDA/bin/flake8 ${12} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
    fi

fi

if [ "$5" = true ] ; then

    echo Running: black --check ${13} $1

    $CONDA/bin/black --check ${13} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
    fi

fi

if [ "$6" = true ] ; then

    echo Running: mypy --ignore-missing-imports --follow-imports=silent --show-column-numbers ${14} $1

    $CONDA/bin/mypy --ignore-missing-imports --follow-imports=silent --show-column-numbers ${14} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
    fi

fi

if [ "$7" = true ] ; then

    echo Running: isort ${15} $1 -c --diff

    $CONDA/bin/isort ${15} $1 -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
    fi

fi

if [ "$8" = true ] ; then

    echo Running: vulture ${16} $1

    $CONDA/bin/vulture ${16} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "vulture ok"
    else
        echo "vulture error"
    fi

fi

if [ "$9" = true ] ; then

    echo Running: pydocstyle ${17} $1

    $CONDA/bin/pydocstyle ${17} $1
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
    fi

fi