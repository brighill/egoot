# gentoo overlay

## Usage

First, install the eselect-repository package from Portage:

```
emerge eselect-repository
```

Then, enable the repo:

```
eselect repository add egoot git https://github.com/brighill/egoot.git
```

After that, use emaint (already included in Portage) to sync the repo and its files:'

```
emaint sync -r egoot
```

Now you're ready to use this repo. 
