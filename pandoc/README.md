# benizar/pandoc
Docker container for Pandoc, with Latex tools installed and some additional resources.

## Custom beamer templates

If you want to use any customized beamer theme, you can find inspiration in [The Ultimate Beamer Theme List](https://github.com/martinbjeldbak/ultimate-beamer-theme-list).

It is [recommended](http://tex.stackexchange.com/a/199480) not to put your custom themes into the official texmf directory. 

Create an appropiate folder:

```bash
mkdir -p $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/beamer/
```

Copy your themes into that folder and then refresh the database:

```bash
texhash
```

*Check the [Dockerfile](Dockerfile) for versions and dependencies.*
