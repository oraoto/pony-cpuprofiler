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

Compile and run your program to get the profile. Then visualize the data With [pprof](https://github.com/google/pprof).

Example output:

```
pprof --text ./counter counter.profile
Using local file ./counter.
Using local file counter.profile.
Total: 235 samples
      99  42.1%  42.1%      226  96.2% ponyint_actor_run
      37  15.7%  57.9%       64  27.2% pony_sendv
      27  11.5%  69.4%       27  11.5% ponyint_messageq_push
      21   8.9%  78.3%       24  10.2% Counter_Dispatch
      11   4.7%  83.0%       17   7.2% ponyint_messageq_pop
       7   3.0%  86.0%        7   3.0% ponyint_pool_free
       6   2.6%  88.5%        8   3.4% ponyint_pool_alloc
       5   2.1%  90.6%        5   2.1% ponyint_heap_startgc
       4   1.7%  92.3%       73  31.1% Main_tag_create_oo
       3   1.3%  93.6%        3   1.3% Counter_tag_increment_o
       3   1.3%  94.9%        4   1.7% ponyint_mpmcq_pop
       3   1.3%  96.2%      235 100.0% run_thread
       2   0.9%  97.0%        2   0.9% pool_get (inline)
       1   0.4%  97.4%        1   0.4% None_val_create_o
       1   0.4%  97.9%        1   0.4% collections_Range_U32_val_ref_has_next_b
       1   0.4%  98.3%        1   0.4% collections_Range_U32_val_ref_next_I
       1   0.4%  98.7%        1   0.4% ponyint_cpu_tick
       1   0.4%  99.1%        3   1.3% ponyint_cycle_block
       1   0.4%  99.6%        1   0.4% ponyint_messageq_markempty
       1   0.4% 100.0%        1   0.4% read_msg
       0   0.0% 100.0%       73  31.1% Main_Dispatch
       0   0.0% 100.0%      235 100.0% __GI___clone
       0   0.0% 100.0%        1   0.4% node_alloc (inline)
       0   0.0% 100.0%        7   3.0% pony_alloc_msg
       0   0.0% 100.0%        1   0.4% ponyint_mpmcq_push_single
       0   0.0% 100.0%      235 100.0% start_thread
```

And graphs:

![Counter](./examples/counter/counter.svg)