# designexporter-plugin-subsvgexport
A plugin to export identified objects to png with inkscape.
Visibility of layers is forced so even objects that are on a hidden layers will be exported.

config file goes like this:
```yaml
subsvgexport:
  - source: path of source file, absolute or relative to conf file
    objects:
      - id: css id (inkscape id)
        dpi: 300 #for example
        output: path to output file
```
