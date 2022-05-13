# Example: creating a conda environment with the latest version of sourmash

*[sourmash-bio/sourmash-examples#6](https://github.com/sourmash-bio/sourmash-examples/issues/6)*

---

Per @bluegenes tested by @jessicalumian. 

Create a file `sourmash-latest.yml` containing the dependencies, plus a pointer to the latest version of sourmash:
```yaml
channels:
  - conda-forge
  - bioconda
  - defaults
dependencies:
  - python=3.9
  - rust
  - pip
  - pip:
    - git+https://github.com/sourmash-bio/sourmash@latest
```
and then run:
```shell
conda env create -n sourmash-latest -f sourmash-latest.yml
```

Wait for it to build (~5 min?) and then
```shell
conda activate sourmash-latest
```
and then run:
```shell
sourmash info
```
