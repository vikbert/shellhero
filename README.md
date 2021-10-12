<div align="center">
  <img src="https://1.bp.blogspot.com/-dBoGxQMuDpA/YFb8qV9LM5I/AAAAAAAAARQ/ImtGfZRZQ9kweL0OJwnI0mtM_udBtZCqwCNcBGAsYHQ/w680/coding%2Bskils%2Bto%2Bget%2Bjob.jpeg" width="480px" alt="aino" />
  <h3>Shell Hero</h3>
  <p>Collection of awesome shell scripts for MacOS that makes life simpler</p>

  <p>
    <a href="#">
      <img src="https://img.shields.io/badge/PRs-Welcome-brightgreen.svg?style=flat-square" alt="PRs Welcome">
    </a>
    <a href="#">
      <img src="https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat-square" alt="MIT License">
    </a>
  </p>
</div>

---

## How to contribute
Add the new scripts to `/src/new_script.sh`, and then follow the [contributing guide](CONTRIBUTING.md)

## getting started
```bash
make 
```

## Script `phps`
> a script to switch the php engine among different installed versions easily on macos.

```bash
# show sub commands in Makefile
make

# install phps as local command on macos
make phps  

# switch to php version 7.4
phps 7.4
```

## Script `git_branch_clean.sh`
> a script to clean up unused branches, that are already merged

```bash
# install phps as local command on macos
make gbclean

# switch to php version 7.4
gbclean --dry-run # dry-run mode to detech which branches will be removed
gbclean # clean up the branches
```


## licence

[MIT](./LICENSE) License © 2021 [@vikbert](https://vikbert.github.io/)
