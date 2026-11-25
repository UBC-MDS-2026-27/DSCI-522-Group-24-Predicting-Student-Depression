FROM ubuntu:24.04

RUN apt-get update && apt-get install --yes \
    curl \
    git \
    less \
    make \
    nano \
    openssh-server

RUN curl --location --output quarto.deb \
    https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.9/quarto-1.11.9-linux-$(dpkg --print-architecture).deb \
    && apt-get install --yes ./quarto.deb \
    && rm quarto.deb

COPY --from=ghcr.io/astral-sh/uv:0.13.7 /uv /uvx /usr/local/bin/

WORKDIR /workspace

ENV UV_PROJECT_ENVIRONMENT=/opt/venv

RUN echo "UV_PROJECT_ENVIRONMENT=$UV_PROJECT_ENVIRONMENT" >> /etc/environment

COPY pyproject.toml uv.lock .python-version ./

RUN uv sync --locked

RUN mkdir -p /run/sshd /root/.ssh

CMD ["/usr/sbin/sshd", "-D"]