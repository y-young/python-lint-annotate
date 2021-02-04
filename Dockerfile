# Container image that runs your code
FROM ricardobchaves6/python-lint-image:1.3.0

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY flake8.json /flake8.json
COPY mypy.json /mypy.json
COPY pylint-error.json /pylint-error.json
COPY pylint-warning.json /pylint-warning.json
COPY vulture.json /vulture.json

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
