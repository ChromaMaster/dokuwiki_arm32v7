# Dokuwiki arm32v7 docker image

# Install

When you want to install dokuwiki for the first time you must comment
the following line from the `nginx.conf` file.

```sh
#Remember to comment the below out when you're installing, and uncomment it when done.
location ~ /(data/|conf/|bin/|inc/|install.php) { deny all; }
```

Of course, after the installation ends, you must uncomment it so that way no one
can access those files.

