NAME={{ cookiecutter.hyphenated }}
USER={{ cookiecutter.github_username }}
VISABILITY={{ cookiecutter.visability }}
uv sync
git init
git add .
git commit -m "Initial commit"
gh repo create ${NAME} ${VISABILITY}
git remote add origin git@github.com:${USER}/${NAME}.git
git branch -M main
git push -u origin main
./bump --yes

