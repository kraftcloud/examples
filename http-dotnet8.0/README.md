# .NET on KraftCloud

To run this example, first [install the `kraft` CLI tool](https://unikraft.org/docs/cli).

To deploy this application on KraftCloud, invoke:

```console
kraft cloud deploy -p 443:8080 -M 512 .
```

## Learn more

- [KraftCloud's Documentation](https://docs.kraft.cloud)
- [How to build `Dockerfile` root filesystems with BuildKit](https://unikraft.org/docs/getting-started/integrations/buildkit)
