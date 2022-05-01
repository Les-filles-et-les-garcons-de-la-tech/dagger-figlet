# External use of a Dagger package

To use the example Dagger FIGlet package, you need first to install the specific dependency running:

```
dagger project update https://github.com/Les-filles-et-les-garcons-de-la-tech/dagger-figlet@main
```

Then you have to vendor Dagger dependencies ruunning:

```
dagger project update
```

You can now run the task to transform a file into FIGlet running:

```
dagger do build
```