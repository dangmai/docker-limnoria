docker-limnoria
===============

Run the IRC bot [Limnoria](https://github.com/ProgVal/Limnoria) in a Docker container.

How to Run
----------

If you're familiar with [Docker](https://www.docker.com/),
the process of running Limnoria is very straightforward:

```
git clone git@github.com:dangmai/docker-limnoria.git
cd docker-limnoria
docker build -t limnoria .
docker run -t limnoria
```

When running the container the first time (or without any `.conf` argument),
the bot will prompt you to create a `.conf` file for later usage.
Let's say the file you create is called `limnoria.conf`.
After the bot creation wizard has finished, you can run the bot by calling:

```
docker run -t limnoria.conf
```

The container exposes `/var/supybot/data` as the directory in which all configurations exist.
Therefore, it is probably a good idea to mount that volume somewhere.
For example, to mount that to a data volume container:

```
docker create -v /var/supybot/data --name botdata tianon/true true
docker run --volumes-from botdata -t limnoria
```

After you do that, you can follow Docker's [backup and restore guide](https://docs.docker.com/userguide/dockervolumes/#backup-restore-or-migrate-data-volumes)
to make sure your data is safe.
