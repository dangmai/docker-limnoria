docker-limnoria
===============

Run the IRC bot [Limnoria](https://github.com/ProgVal/Limnoria) in a Docker container.

How to Run
----------

If you're familiar with [Docker](https://www.docker.com/),
the process of running Limnoria is very straightforward.
If it is your first time running Limnoria,
run the following command to generate a `.conf` file
(it will be saved on the host machine at `~/bot-data`,
change it you want to):

```
docker run -v ~/bot-data:/var/supybot/data --rm -it dangmai/limnoria
```

The bot will prompt you to create a `.conf` file for later usage.
Let's say the file you create is called `limnoria.conf`.
After the bot creation wizard has finished, you can run the bot by calling:

```
docker run -d -v ~/bot-data:/var/supybot/data --name limnoria dangmai/limnoria limnoria.conf
```

The container exposes `/var/supybot/data` as the directory in which all configurations exist.
Therefore, it is probably a good idea to mount that volume somewhere.
For example, to mount that to a data volume container:

```
docker create -v /var/supybot/data --name botdata tianon/true true
docker run --volumes-from botdata -t limnoria
```

After you do that, you can follow Docker's [backup and restore guide](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes)
to make sure your data is safe.
