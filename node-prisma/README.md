# Node Prisma Example

This directory contains a simple [Prisma](https://www.prisma.io/) example (using avaScript for [Node](https://nodejs.org/en/)) running with Unikraft in binary compatibility mode.
The image opens up a server and provides routes for results.

## Quick Run

Use `kraft` to run the image:

```console
kraft run -M 512M -p 8080:8080
```

Once executed, it will open port `8080` and wait for connections, and can be queried.

Query the service using:

```console
curl localhost:8080
```

It will print a "Hello, World!" message.

## Scripted Run

Use the scripted runs, detailed in the common `../README.md`.
Once you run the the scripts, query the service:

```console
curl 172.44.0.2:8080
```
