FROM python:3.10.8

RUN pip install "poetry==1.2.0"

WORKDIR /code
COPY . /code/

# Project initialization:
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

ENTRYPOINT python scripts/compile_and_deploy.py 