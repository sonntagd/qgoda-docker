# Qgoda Docker Image

Add an alias to your `.bashrc` / `.zshrc` to use `qgoda` without any docker commands:

```
alias qgoda='docker run --rm -it -v $(pwd):/data dsonntag/qgoda'
```