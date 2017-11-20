# CPU Profiler

This package provides bindings to google's cpuprofiler library.

# Usage

```
use cpuprofiler

actor Main
  new create(env: Env) =>

    Profiler.start("out.profile")

    // Your code

    Profiler.stop()
```

# TODO

- [ ] Multithread safety
- [ ] Expose more cpuprofiler API
