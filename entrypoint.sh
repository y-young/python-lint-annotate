#!/bin/sh -l

# Parameters
#
# $1 - use-pylint
# $2 - use-pycodestyle
# $3 - use-flake8
# $4 - use-black
# $5 - use-mypy
# $6 - use-isort
# $7 - use-vulture
# $8 - use-pydocstyle
# $9 - extra-pylint-options
# $10 - extra-pycodestyle-options
# $11 - extra-flake8-options
# $12 - extra-black-options
# $13 - extra-mypy-options
# $14 - extra-isort-options
# $15 - extra-vulture-options
# $16 - extra-pydocstyle-options
# $@ - python-root-list

echo use-pylint:                $1
echo use-pycodestyle:           $2
echo use-flake8:                $3
echo use-black:                 $4
echo use-mypy:                  $5
echo use-isort:                 $6
echo use-vulture:               $7
echo use-pydocstyle:            $8
echo extra-pylint-options:      $9
echo extra-pycodestyle-options: $10
echo extra-flake8-options:      $11
echo extra-black-options:       $12
echo extra-mypy-options:        $13
echo extra-isort-options:       $14
echo extra-vulture-options:     $15
echo extra-pydocstyle-options:  $16
# rename command line arguments so tha last argument receives what is remaining
# change this number if more lintners are added
shift 16
echo python-root-list:          $@

# actions path has the copy of this actions repo
for matcher in $GITHUB_ACTION_PATH/matchers/*.json
do
    echo adding matcher $matcher
    echo "::add-matcher::${matcher}"
done
echo "TERM: changing from $TERM -> xterm"
export TERM=xterm

if [ "$1" = true ] ; then

    echo Running: pylint $8 $@

    $CONDA/bin/pylint --output-format="colorized" $8 $@
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Pylint ok"
    else
        echo "Pylint error"
    fi

fi


if [ "$2" = true ] ; then

    echo Running: pycodestyle ${10} $@

    $CONDA/bin/pycodestyle ${10} $@
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
    fi

fi

if [ "$3" = true ] ; then

    echo Running: flake8 ${11} $@

    $CONDA/bin/flake8 ${11} $@
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Flake8 ok"
    else
        echo "Flake8 error"
    fi

fi

if [ "$4" = true ] ; then

    echo Running: black --check ${12} $@

    $CONDA/bin/black --check ${12} $@
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "Black ok"
    else
        echo "Black error"
    fi

fi

if [ "$5" = true ] ; then

    echo Running: mypy --ignore-missing-imports --follow-imports=silent --show-column-numbers ${13} $@

    $CONDA/bin/mypy --ignore-missing-imports --follow-imports=silent --show-column-numbers ${13} $@
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "mypy ok"
    else
        echo "mypy error"
    fi

fi

if [ "$6" = true ] ; then

    echo Running: isort ${14} $@ -c --diff

    $CONDA/bin/isort ${14} $@ -c --diff
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "isort ok"
    else
        echo "isort error"
    fi

fi

if [ "$7" = true ] ; then

    echo Running: vulture ${15} $@

    $CONDA/bin/vulture ${15} $@
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "vulture ok"
    else
        echo "vulture error"
    fi

fi

if [ "$8" = true ] ; then

    echo Running: pydocstyle ${16} $@

    $CONDA/bin/pydocstyle ${16} $@
    exit_code=$?

    if [ "$exit_code" = "0" ]; then
        echo "pycodestyle ok"
    else
        echo "pycodestyle error"
    fi

fi