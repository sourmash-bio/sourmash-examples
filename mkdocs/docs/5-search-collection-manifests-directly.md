# Example: search collection manifests directly

*[sourmash-bio/sourmash-examples#5](https://github.com/sourmash-bio/sourmash-examples/issues/5)*

---

This example follows from [Example: use picklists and manifests to work with a small subset of a large database](4-use-picklists-and-manifests-to-work-with-a-small-subset-of-a-large-database.md).

In #4, we see how to use a picklist to search a small subset of GTDB. But we can make this even simpler.

## Build a manifest that you can search directly

Specifying the picklist is cumbersome if you want to search this database repeatedly. sourmash also lets you build a  collection manifest that contains pointers into the database, using `sig check` ([doc link](https://sourmash.readthedocs.io/en/latest/command-line.html#sourmash-signature-check-compare-picklists-and-manifests)).

To create the collection manifest, first make a "pathlist" file, a text file containing the paths of sourmash databases you want to work with. In this case, the file will only contain one pathname, the GTDB database.

```
ls gtdb-rs207.genomic-reps.dna.k31.zip > pathlist.txt
```

Then, run:
```
sourmash sig check --picklist shew-picklist.csv:name:name \
     pathlist.txt --save-manifest shew-mf.csv
```
which will create a manifest in `shew-mf.csv` for all the entries that match the given picklist.

You can now search this manifest file directly:
```
sourmash search shew-query.sig shew-mf.csv
```


## Categories

This example belongs to the following categories:

 * [examples of using manifests](l-manifests.md)
 * [advanced examples](l-advanced.md)
 * [examples that need improvement](l-needs-improvement.md)


