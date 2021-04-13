# wphl-bioinformatics

Bioinformatics scripts for use at the Wyoming Public Health Laboratory.

These scripts have various purposes, uses, and instructions. The only unifying
thing about them is that they were all written for WPHL. Please check the
`README` file in each directory for more detailed instructions.

## Encryption

**NOTICE:** Some files in this repository are encrypted using
[git-crypt](https://github.com/AGWA/git-crypt). git-crypt works on a
repository-wide basis, meaning that decryption must occur on the entire
repository.

### Installing git-crypt

#### Ubuntu, Debian, etc.

```bash
sudo apt-get install git-crypt -y
```

#### Fedora, CentOS, RHEL, etc.

```bash
sudo yum install git-crypt -y
```

#### MacOS

Install [Homebrew](https://brew.sh/) first. Then

```bash
brew install git-crypt
```

#### Windows

There are no official git-crypt builds for Windows. I repeat, **git-crypt does
not exist for Windows** regardless of what others may tell you. If possible, you
may use the [Windows Subsystem for
Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10), but you
cannot use native git-crypt.

### Decrypting the repository

Encryption is GPG-based. If your GPG key has been added to the repository (you
know if you have access), then run

```bash
git clone https://github.com/MillironX/wphl-bioinformatics.git && cd wphl-bioinformatics
git-crypt unlock
```

The files will now be decrypted and can be usable.

If you need to copy your GPG keys to a new machine to be able to decrypt the
files, follow the instructions at
https://www.phildev.net/pgp/gpg_moving_keys.html under "Copy Just Your Keys."
