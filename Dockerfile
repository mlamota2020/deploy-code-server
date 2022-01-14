FROM codercom/code-server:3.10.2

USER coder

COPY deploy-container/settings.json .local/share/code-server/User/settings.json

ENV SHELL=/bin/bash

RUN sudo apt-get update && sudo apt-get install unzip -y

RUN curl https://rclone.org/install.sh | sudo bash

COPY deploy-container/rclone-tasks.json /tmp/rclone-tasks.json

ENV PORT=8080

COPY deploy-container/entrypoint.sh /usr/bin/deploy-container-entrypoint.sh

ENTRYPOINT ["/usr/bin/deploy-container-entrypoint.sh"]

RUN code-server --install-extension esbenp.prettier-vscode

RUN code-server --install-extension brittanychiang.halcyon-vscode

RUN code-server --install-extension pkief.material-icon-theme

RUN code-server --install-extension eamodio.gitlens

RUN code-server --install-extension bradlc.vscode-tailwindcss

RUN code-server --install-extension formulahendry.auto-rename-tag
