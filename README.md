# designexporter-plugin-subsvgexport
A plugin to export identified objects to png with inkscape

config file goes like this:
```yaml
subsvgexport:
  - source: path of source file, absolute or relative to conf file
    objects:
      - id: css id (inkscape id)
        dpi: 300 #for example
        only: true #enable "--export-id-only" inkscape flag
        output: path to output file
```
